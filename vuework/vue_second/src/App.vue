<template>
  <div class="menu">
  <img alt="Vue logo" src="./assets/logo.png">
  <a v-for="h in arr" :key="h">{{ h }}</a>

  <div v-for="h in products" :key="h">
        <img :src="h.imgSrc">
        <h4>{{ h.name}}</h4>
        <h4>{{ h.company }}</h4>
        <button type="button" @click="h.likes++">{{h.likes}}</button>
  </div>
  
  
<!-- 
  <h3>{{num}}</h3>
  <button type="button" @click="plus">증가</button>
  <button v-on:click="minus">감소</button> -->

 
</div>
</template>

<script>

export default {
  name: 'App',
  data(){
    return{ 
          //  num:10
           arr:['home','shop','board','About'],
           products:[{name:'김태희',company:'하이브',likes:0,imgSrc:require("./assets/연예인사진/10.jpg")},
                     {name:'여진구',company:'하이브',likes:0,imgSrc:require("./assets/연예인사진/1.jpg")},
                     {name:'박보영',company:'하이브',likes:0,imgSrc:require("./assets/연예인사진/12.jpg")},
                     {name:'김영광',company:'하이브',likes:0,imgSrc:require("./assets/연예인사진/3.jpg")},
                     {name:'유아인',company:'하이브',likes:0,imgSrc:require("./assets/연예인사진/20.jpg")}
          ],
    }
     
  },
  methods:{

  },
  components: {
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

.menu a{
  color: green;
  padding: 10px;
}
a{
  color: blue;
  padding: 10px;
}
</style>
