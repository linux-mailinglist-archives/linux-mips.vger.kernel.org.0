Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C2A3D47DF
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 15:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbhGXMwZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 08:52:25 -0400
Received: from out29-123.mail.aliyun.com ([115.124.29.123]:55910 "EHLO
        out29-123.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhGXMwY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 08:52:24 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_regular_dialog|0.00573593-0.000710132-0.993554;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047209;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.Kq-hZtx_1627133573;
Received: from 192.168.88.130(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Kq-hZtx_1627133573)
          by smtp.aliyun-inc.com(10.147.40.7);
          Sat, 24 Jul 2021 21:32:54 +0800
Subject: Re: [PATCH 2/2] remoteproc: Ingenic: Add support for new Ingenic
 SoCs.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
References: <1627117898-125239-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1627117898-125239-3-git-send-email-zhouyanjie@wanyeetech.com>
 <QXXQWQ.G04EHJWEN1TT3@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <43ed7b75-bce6-6901-c225-262fe88b088a@wanyeetech.com>
Date:   Sat, 24 Jul 2021 21:32:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <QXXQWQ.G04EHJWEN1TT3@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2021/7/24 下午7:15, Paul Cercueil wrote:
> Hi Zhou,
>
> Le sam., juil. 24 2021 at 17:11:38 +0800, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Add support for probing the ingenic_rproc driver on the JZ4760 SoC,
>> the JZ4760B SoC, the JZ4775 SoC, and the JZ4780 SoC from Ingenic.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>  drivers/remoteproc/ingenic_rproc.c | 115 
>> +++++++++++++++++++++++++++++--------
>>  1 file changed, 91 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/remoteproc/ingenic_rproc.c 
>> b/drivers/remoteproc/ingenic_rproc.c
>> index a356738..6a2e864 100644
>> --- a/drivers/remoteproc/ingenic_rproc.c
>> +++ b/drivers/remoteproc/ingenic_rproc.c
>> @@ -2,6 +2,7 @@
>>  /*
>>   * Ingenic JZ47xx remoteproc driver
>>   * Copyright 2019, Paul Cercueil <paul@crapouillou.net>
>> + * Copyright 2021, 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>   */
>>
>>  #include <linux/bitops.h>
>> @@ -17,7 +18,7 @@
>>
>>  #define REG_AUX_CTRL        0x0
>>  #define REG_AUX_MSG_ACK        0x10
>> -#define REG_AUX_MSG        0x14
>> +#define REG_AUX_MSG            0x14
>>  #define REG_CORE_MSG_ACK    0x18
>>  #define REG_CORE_MSG        0x1C
>>
>> @@ -32,6 +33,20 @@ module_param(auto_boot, bool, 0400);
>>  MODULE_PARM_DESC(auto_boot,
>>           "Auto-boot the remote processor [default=false]");
>>
>> +enum ingenic_vpu_version {
>> +    ID_JZ4760,
>> +    ID_JZ4770,
>> +    ID_JZ4775,
>> +};
>
> The "version" field of ingenic_so_cinfo is not used anywhere, so you 
> can drop this enum completely.


Sure, I will remove it.


>
>> +
>> +struct ingenic_soc_info {
>> +    enum ingenic_vpu_version version;
>> +    const struct vpu_mem_map *mem_map;
>> +
>> +    unsigned int num_clks;
>> +    unsigned int num_mems;
>> +};
>> +
>>  struct vpu_mem_map {
>>      const char *name;
>>      unsigned int da;
>> @@ -43,26 +58,21 @@ struct vpu_mem_info {
>>      void __iomem *base;
>>  };
>>
>> -static const struct vpu_mem_map vpu_mem_map[] = {
>> -    { "tcsm0", 0x132b0000 },
>> -    { "tcsm1", 0xf4000000 },
>> -    { "sram",  0x132f0000 },
>> -};
>> -
>>  /**
>>   * struct vpu - Ingenic VPU remoteproc private structure
>>   * @irq: interrupt number
>>   * @clks: pointers to the VPU and AUX clocks
>>   * @aux_base: raw pointer to the AUX interface registers
>> - * @mem_info: array of struct vpu_mem_info, which contain the 
>> mapping info of
>> + * @mem_info: pointers to the struct vpu_mem_info, which contain the 
>> mapping info of
>>   *            each of the external memories
>>   * @dev: private pointer to the device
>>   */
>>  struct vpu {
>>      int irq;
>> -    struct clk_bulk_data clks[2];
>>      void __iomem *aux_base;
>> -    struct vpu_mem_info mem_info[ARRAY_SIZE(vpu_mem_map)];
>> +    const struct ingenic_soc_info *soc_info;
>> +    struct clk_bulk_data *clks;
>> +    struct vpu_mem_info *mem_info;
>>      struct device *dev;
>>  };
>>
>> @@ -72,7 +82,7 @@ static int ingenic_rproc_prepare(struct rproc *rproc)
>>      int ret;
>>
>>      /* The clocks must be enabled for the firmware to be loaded in 
>> TCSM */
>> -    ret = clk_bulk_prepare_enable(ARRAY_SIZE(vpu->clks), vpu->clks);
>> +    ret = clk_bulk_prepare_enable(vpu->soc_info->num_clks, vpu->clks);
>>      if (ret)
>>          dev_err(vpu->dev, "Unable to start clocks: %d\n", ret);
>>
>> @@ -83,7 +93,7 @@ static int ingenic_rproc_unprepare(struct rproc 
>> *rproc)
>>  {
>>      struct vpu *vpu = rproc->priv;
>>
>> -    clk_bulk_disable_unprepare(ARRAY_SIZE(vpu->clks), vpu->clks);
>> +    clk_bulk_disable_unprepare(vpu->soc_info->num_clks, vpu->clks);
>>
>>      return 0;
>>  }
>> @@ -127,7 +137,7 @@ static void *ingenic_rproc_da_to_va(struct rproc 
>> *rproc, u64 da, size_t len, boo
>>      void __iomem *va = NULL;
>>      unsigned int i;
>>
>> -    for (i = 0; i < ARRAY_SIZE(vpu_mem_map); i++) {
>> +    for (i = 0; i < vpu->soc_info->num_mems; i++) {
>>          const struct vpu_mem_info *info = &vpu->mem_info[i];
>>          const struct vpu_mem_map *map = info->map;
>>
>> @@ -163,8 +173,60 @@ static irqreturn_t vpu_interrupt(int irq, void 
>> *data)
>>      return rproc_vq_interrupt(rproc, vring);
>>  }
>>
>> +static const struct vpu_mem_map jz4760_vpu_mem_map[] = {
>> +    { "tcsm0", 0x132b0000 },
>> +    { "tcsm1", 0xf4000000 },
>> +    { "sram",  0x132d0000 },
>> +};
>> +
>> +static const struct vpu_mem_map jz4770_vpu_mem_map[] = {
>> +    { "tcsm0", 0x132b0000 },
>> +    { "tcsm1", 0xf4000000 },
>> +    { "sram",  0x132f0000 },
>> +};
>> +
>> +static const struct vpu_mem_map jz4775_vpu_mem_map[] = {
>> +    { "tcsm",  0xf4000000 },
>> +    { "sram",  0x132f0000 },
>> +};
>> +
>> +static const struct ingenic_soc_info jz4760_soc_info = {
>> +    .version = ID_JZ4760,
>> +    .mem_map = jz4760_vpu_mem_map,
>> +
>> +    .num_clks = 2,
>> +    .num_mems = 3,
>
> .num_mems = ARRAY_SIZE(jz4760_vpu_mem_map),
>
> And the same for the other ingenic_soc_info below.


Sure.


>
>> +};
>> +
>> +static const struct ingenic_soc_info jz4770_soc_info = {
>> +    .version = ID_JZ4770,
>> +    .mem_map = jz4770_vpu_mem_map,
>> +
>> +    .num_clks = 2,
>> +    .num_mems = 3,
>> +};
>> +
>> +static const struct ingenic_soc_info jz4775_soc_info = {
>> +    .version = ID_JZ4775,
>> +    .mem_map = jz4775_vpu_mem_map,
>> +
>> +    .num_clks = 1,
>> +    .num_mems = 2,
>> +};
>> +
>> +static const struct of_device_id ingenic_rproc_of_matches[] = {
>> +    { .compatible = "ingenic,jz4760-vpu-rproc", .data = 
>> &jz4760_soc_info },
>> +    { .compatible = "ingenic,jz4760b-vpu-rproc", .data = 
>> &jz4760_soc_info },
>> +    { .compatible = "ingenic,jz4770-vpu-rproc", .data = 
>> &jz4770_soc_info },
>> +    { .compatible = "ingenic,jz4775-vpu-rproc", .data = 
>> &jz4775_soc_info },
>> +    { .compatible = "ingenic,jz4780-vpu-rproc", .data = 
>> &jz4775_soc_info },
>> +    {}
>> +};
>> +MODULE_DEVICE_TABLE(of, ingenic_rproc_of_matches);
>> +
>>  static int ingenic_rproc_probe(struct platform_device *pdev)
>>  {
>> +    const struct of_device_id *id = 
>> of_match_node(ingenic_rproc_of_matches, pdev->dev.of_node);
>>      struct device *dev = &pdev->dev;
>>      struct resource *mem;
>>      struct rproc *rproc;
>> @@ -181,6 +243,7 @@ static int ingenic_rproc_probe(struct 
>> platform_device *pdev)
>>
>>      vpu = rproc->priv;
>>      vpu->dev = &pdev->dev;
>> +    vpu->soc_info = id->data;
>
> Use of_device_get_match_data(dev).
>
> Then you can get rid of the "id" variable, and you won't have to move 
> the "ingenic_rproc_of_matches" array.


Sure, I will try.


>
>>      platform_set_drvdata(pdev, vpu);
>>
>>      mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aux");
>> @@ -190,9 +253,13 @@ static int ingenic_rproc_probe(struct 
>> platform_device *pdev)
>>          return PTR_ERR(vpu->aux_base);
>>      }
>>
>> -    for (i = 0; i < ARRAY_SIZE(vpu_mem_map); i++) {
>> +    vpu->mem_info = kzalloc(sizeof(struct vpu_mem_info) * 
>> vpu->soc_info->num_mems, GFP_KERNEL);
>
> You are leaking memory here.
>
> Also, why not just fix the current mem_info array size to 3? That 
> sounds way simpler.


Sure.


>
>> +    if (!vpu->mem_info)
>> +        return -ENOMEM;
>> +
>> +    for (i = 0; i < vpu->soc_info->num_mems; i++) {
>>          mem = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> -                           vpu_mem_map[i].name);
>> + vpu->soc_info->mem_map[i].name);
>>
>>          vpu->mem_info[i].base = devm_ioremap_resource(dev, mem);
>>          if (IS_ERR(vpu->mem_info[i].base)) {
>> @@ -202,13 +269,19 @@ static int ingenic_rproc_probe(struct 
>> platform_device *pdev)
>>          }
>>
>>          vpu->mem_info[i].len = resource_size(mem);
>> -        vpu->mem_info[i].map = &vpu_mem_map[i];
>> +        vpu->mem_info[i].map = &vpu->soc_info->mem_map[i];
>>      }
>>
>> +    vpu->clks = kzalloc(sizeof(struct clk_bulk_data) * 
>> vpu->soc_info->num_clks, GFP_KERNEL);
>
> Same here, the "clks" array is already size 2, so it won't be a 
> problem if you have only one clock. No need to alloc "clks" dynamically.


Sure.


>
>> +    if (!vpu->clks)
>> +        return -ENOMEM;
>> +
>>      vpu->clks[0].id = "vpu";
>> -    vpu->clks[1].id = "aux";
>>
>> -    ret = devm_clk_bulk_get(dev, ARRAY_SIZE(vpu->clks), vpu->clks);
>> +    if (vpu->soc_info->version == ID_JZ4770)
>> +        vpu->clks[1].id = "aux";
>> +
>> +    ret = devm_clk_bulk_get(dev, vpu->soc_info->num_clks, vpu->clks);
>>      if (ret) {
>>          dev_err(dev, "Failed to get clocks\n");
>>          return ret;
>> @@ -235,12 +308,6 @@ static int ingenic_rproc_probe(struct 
>> platform_device *pdev)
>>      return 0;
>>  }
>>
>> -static const struct of_device_id ingenic_rproc_of_matches[] = {
>> -    { .compatible = "ingenic,jz4770-vpu-rproc", },
>> -    {}
>> -};
>> -MODULE_DEVICE_TABLE(of, ingenic_rproc_of_matches);
>
> As I wrote above - you don't need to move this.


Sure.


Thanks and best regards!


>
> Cheers,
> -Paul
>
>> -
>>  static struct platform_driver ingenic_rproc_driver = {
>>      .probe = ingenic_rproc_probe,
>>      .driver = {
>> -- 
>> 2.7.4
>>
>
