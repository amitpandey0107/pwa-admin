<!DOCTYPE html>
<html>
<head>
	<title>Excel Export</title>
</head>
<body>
	<table>
    <thead>
    <tr>

        <th>id</th>
        <th>land_size</th>
    </tr>
    </thead>
    <tbody>
    @foreach($data as $userData)
        <tr>
            <td>{{ $userData->id }}</td>
            <td>{{ $userData->land_size }}</td>
        </tr>
    @endforeach
    </tbody>
</table>
</body>
</html>