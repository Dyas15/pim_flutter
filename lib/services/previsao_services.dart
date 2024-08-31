import 'package:teste/models/previsao_hora.dart';

class PrevisaoServices {
  List<PrevisaoHora> recuperarUltimasPrevisoes() {
    return [
      PrevisaoHora(horario: '11:00', descricao: 'Ensolarado', numeroIcone: 1, temperatura: 32),
      PrevisaoHora(horario: '12:00', descricao: 'Ensolarado', numeroIcone: 1, temperatura: 33),
      PrevisaoHora(horario: '13:00', descricao: 'Ensolarado', numeroIcone: 1, temperatura: 34),
      PrevisaoHora(horario: '14:00', descricao: 'Ensolarado', numeroIcone: 1, temperatura: 35),
      PrevisaoHora(horario: '15:00', descricao: 'Ensolarado', numeroIcone: 1, temperatura: 35),
      PrevisaoHora(horario: '16:00', descricao: 'Ensolarado', numeroIcone: 1, temperatura: 34),
      PrevisaoHora(horario: '17:00', descricao: 'Parcialmente Ensolarado', numeroIcone: 2, temperatura: 34),
      PrevisaoHora(horario: '18:00', descricao: 'Nuvens esparsas', numeroIcone: 3, temperatura: 29),
      PrevisaoHora(horario: '19:00', descricao: 'Nuvens esparsas', numeroIcone: 3, temperatura: 26),
      PrevisaoHora(horario: '20:00', descricao: 'Nuvens esparsas', numeroIcone: 3, temperatura: 25),
      PrevisaoHora(horario: '21:00', descricao: 'Nuvens esparsas', numeroIcone: 5, temperatura: 25),
    ];
  }
}