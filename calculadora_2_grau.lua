--==============================================================
--  Nome do Arquivo : calculadora_2_grau.lua
--  Autor           : Rafael Oliveira Capistrano Pinho
--  Data de Criação : 18/10/2025
--  Última Atualização : 18/10/2025
--  Versão          : 1.0
--
--  Descrição :
--      Este script calcula o delta, as raízes e os vértices de uma equação do 2º Grau.
--
--  Linguagem       : Lua 5.4
--  Dependências    :
--      - nenhuma
--
--  Como Usar :
--      Execute com: lua calculadora_2_grau.lua
--
--  Histórico de Alterações :
--      1.0 - Criação do arquivo e implementação inicial (18/10/2025)
--==============================================================

local function validacao_entrada(coeficiente)
  local valor
  repeat
    io.write("Coeficiente " .. coeficiente .. ": ")
    valor = tonumber(io.read())
    if valor == nil then
      print("Entrada inválida. Digite um número válido.")
    elseif coeficiente == "a" and valor == 0 then
      print("O coeficiente 'a' deve ser diferente de zero.")
      valor = nil
    end
  until valor ~= nil
  return valor
end

local function calcular_delta (a, b, c)
  return b^2 - 4 * a * c
end

local function calcular_raizes(a, b, c, delta)
  if delta >= 0 then
    local raiz_delta = math.sqrt(delta)
    local x1 = (-b + raiz_delta) / (2 * a)
    local x2 = (-b - raiz_delta) / (2 * a)
    return x1, x2
  end
end

local function calcular_vertices(a, b, delta)
  local x_vertice = -b / (2 * a)
  local y_vertice = -delta / (4 * a)
  return x_vertice, y_vertice
end

local function exibir_resultados(a, delta, x1, x2, x_vertice, y_vertice)
  print("\n>> CONCAVIDADE DA PARÁBOLA")
  if a > 0 then
    print("Concavidade da parábola voltada para cima.")
  else
    print("Concavidade da parábola voltada para baixo.")
  end
  print("\n>> CÁLCULO DO DISCRIMINANTE (DELTA)")
  if delta > 0 then
    print("Delta = " .. string.format("%.4f", delta))
    print("Delta maior que zero. A equação possui duas raízes reais e distintas.")
  elseif delta == 0 then
    print("Delta = " .. string.format("%.4f", delta))
    print("Delta igual a zero. A equação possui uma única raiz real (ou duas raízes reais e idênticas)")
  else
    print("Delta menor que zero. A equação não possui raízes reais.")
  end
  print("\n>> CÁLCULO DAS RAÍZES")
  if delta>=0 then
    print("X1 = " .. string.format("%.4f", x1))
    print("X2 = " .. string.format("%.4f", x2))
  else
    print("Não existem raízes reais.")
  end

  print("\n>> CÁLCULO DOS VÉRTICES")
  print("X vértice = " .. string.format("%.4f", x_vertice))
  print("Y vértice = " .. string.format("%.4f", y_vertice))
  print("VÉRTICE = (" .. string.format("%.4f", x_vertice) .. ", " .. string.format("%.4f", y_vertice) .. ")")
end

local function reinicializar()
  io.write("\nATENÇÃO:\nContinuar calculando? (s para continuar): ")
  local resposta = io.read()
  return resposta == "s" or resposta == "S"
end

repeat
  print("\n========== CALCULADORA DE EQUAÇÕES DO 2º GRAU =========\n")
  local a = validacao_entrada("a")
  local b = validacao_entrada("b")
  local c = validacao_entrada("c")

  local delta = calcular_delta(a, b, c)

  local x1, x2 = calcular_raizes(a, b, c, delta)

  local x_vertice, y_vertice = calcular_vertices(a, b, delta)

  exibir_resultados(a, delta, x1, x2, x_vertice, y_vertice)

  local continuar = reinicializar()
until not continuar
print("Terminando aplicação por solicitação do usuário...")
