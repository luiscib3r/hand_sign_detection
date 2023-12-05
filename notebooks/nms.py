def nms(bboxes, scores, threshold=0.5):
    """
    Aplica la supresión no máxima (NMS) a un conjunto de bounding boxes.

    Parámetros:
    - bboxes: Lista de bounding boxes en el formato (x1, y1, x2, y2).
    - scores: Lista de puntajes de confianza asociados a cada bounding box.
    - threshold: Umbral de IoU para decidir si dos bounding boxes se superponen lo suficiente como para eliminar uno.

    Retorna:
    - Lista de índices de los bounding boxes seleccionados después de aplicar NMS.
    """
    selected_indices = []

    # Ordenar las bounding boxes por puntaje de confianza en orden descendente
    sorted_indices = sorted(range(len(scores)), key=lambda i: scores[i], reverse=True)

    while len(sorted_indices) > 0:
        # Tomar la bounding box con el puntaje más alto
        current_index = sorted_indices[0]
        selected_indices.append(current_index)

        # Calcular IoU con las demás bounding boxes
        current_bbox = bboxes[current_index]
        remaining_indices = []
        for i in range(1, len(sorted_indices)):
            next_index = sorted_indices[i]
            next_bbox = bboxes[next_index]
            iou = calculate_iou(current_bbox, next_bbox)

            # Si la superposición (IoU) es menor que el umbral, conservar la bounding box
            if iou < threshold:
                remaining_indices.append(next_index)

        sorted_indices = remaining_indices

    return selected_indices

def calculate_iou(bbox1, bbox2):
    """
    Calcula la intersección sobre unión (IoU) entre dos bounding boxes.

    Parámetros:
    - bbox1, bbox2: Bounding boxes en el formato (x1, y1, x2, y2).

    Retorna:
    - Valor de IoU.
    """
    x1_i = max(bbox1[0], bbox2[0])
    y1_i = max(bbox1[1], bbox2[1])
    x2_i = min(bbox1[2], bbox2[2])
    y2_i = min(bbox1[3], bbox2[3])

    intersection_area = max(0, x2_i - x1_i) * max(0, y2_i - y1_i)

    area_bbox1 = (bbox1[2] - bbox1[0]) * (bbox1[3] - bbox1[1])
    area_bbox2 = (bbox2[2] - bbox2[0]) * (bbox2[3] - bbox2[1])

    union_area = area_bbox1 + area_bbox2 - intersection_area

    iou = intersection_area / union_area if union_area > 0 else 0

    return iou

# Ejemplo de uso
bboxes = [(12, 84, 140, 212), (24, 95, 142, 200), (36, 80, 120, 200)]
scores = [0.9, 0.85, 0.95]

selected_indices = nms(bboxes, scores, threshold=0.5)

# Imprimir los índices seleccionados después de NMS
print("Bounding boxes seleccionados después de NMS:", selected_indices)
