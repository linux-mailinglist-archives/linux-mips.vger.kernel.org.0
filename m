Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0E757574D4
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jul 2023 09:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbjGRHBO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Jul 2023 03:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbjGRHBF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Jul 2023 03:01:05 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DA0EA1B5;
        Tue, 18 Jul 2023 00:01:02 -0700 (PDT)
Received: from loongson.cn (unknown [10.20.42.170])
        by gateway (Coremail) with SMTP id _____8BxyeqtOLZkwoMGAA--.7544S3;
        Tue, 18 Jul 2023 15:01:01 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxzM6sOLZkoNAyAA--.9474S3;
        Tue, 18 Jul 2023 15:01:00 +0800 (CST)
Message-ID: <2fd7fa12-c9c7-3c12-fa02-872cbbbfc5e2@loongson.cn>
Date:   Tue, 18 Jul 2023 15:01:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/2] irqchip/loongson-eiointc: Simplify irq routing on
 some platforms
From:   bibo mao <maobibo@loongson.cn>
To:     Jianmin Lv <lvjianmin@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Marc Zyngier <maz@kernel.org>
References: <20230713032243.2046205-1-maobibo@loongson.cn>
 <20230713032243.2046205-3-maobibo@loongson.cn>
Content-Language: en-US
In-Reply-To: <20230713032243.2046205-3-maobibo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxzM6sOLZkoNAyAA--.9474S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW3Gr1kZFWDtF4rCF1kurWUWrX_yoW7ZF1fpF
        WUGas0qrW5XFy7Wr9aka1DZa4avr93X3yqqF1fWayxAFZ8ua1UKF1FyFnrZF10k34UAF1j
        yF45Xry8u3Z8AagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
        sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
        0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
        IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
        e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
        0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
        xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
        1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
        67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
        AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
        F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
        1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
        xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
        1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zw
        Z7UUUUU==
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Jianmin,

Do you have any comments so that I can update in the next version together?
since you are original author of eiointc driver.

Is it possible to add extra specific version in eiointc acpi table for
virt-machine in future? For specific eiointc, irq can be routed to all
cpus rather cpu 0-3, I do not know whether it is deserved for qemu
virt-machine alone.

Regards
Bibo Mao

在 2023/7/13 11:22, Bibo Mao 写道:
> Some LoongArch systems have only one eiointc node such as 3A5000/2K2000
> and qemu virt-machine. If there is only one eiointc node, all cpus can
> access eiointc registers directly; if there is multiple eiointc nodes, each
> cpu can only access eiointc belonging to specified node group, so anysend
> or ipi needs to be used to configure irq routing. IRQ routing is simple on
> such systems with one node, hacking method like anysend is not necessary.
> 
> This patch provides simpile IRQ routing method for systems with one eiointc
> node, and is tested on 3A5000 board and qemu virt-machine.
> 
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  drivers/irqchip/irq-loongson-eiointc.c | 80 ++++++++++++++++++++++++--
>  1 file changed, 74 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
> index 603d323b8f8b..e6be9d6a18c8 100644
> --- a/drivers/irqchip/irq-loongson-eiointc.c
> +++ b/drivers/irqchip/irq-loongson-eiointc.c
> @@ -127,6 +127,48 @@ static int eiointc_set_irq_affinity(struct irq_data *d, const struct cpumask *af
>  	return IRQ_SET_MASK_OK;
>  }
>  
> +static int eiointc_single_set_irq_affinity(struct irq_data *d,
> +				const struct cpumask *affinity, bool force)
> +{
> +	unsigned int cpu;
> +	unsigned long flags;
> +	uint32_t vector, regaddr, data, coremap;
> +	struct cpumask mask;
> +	struct eiointc_priv *priv = d->domain->host_data;
> +
> +	cpumask_and(&mask, affinity, cpu_online_mask);
> +	cpumask_and(&mask, &mask, &priv->cpuspan_map);
> +	if (cpumask_empty(&mask))
> +		return -EINVAL;
> +
> +	cpu = cpumask_first(&mask);
> +	vector = d->hwirq;
> +	regaddr = EIOINTC_REG_ENABLE + ((vector >> 5) << 2);
> +	data = ~BIT(vector & 0x1F);
> +	coremap = BIT(cpu_logical_map(cpu) % CORES_PER_EIO_NODE);
> +
> +	/*
> +	 * simplify for platform with only one eiointc node
> +	 * access eiointc registers directly rather than
> +	 * use any_send method here
> +	 */
> +	raw_spin_lock_irqsave(&affinity_lock, flags);
> +	iocsr_write32(EIOINTC_ALL_ENABLE & data, regaddr);
> +	/*
> +	 * get irq route info for continuous 4 vectors
> +	 * and set affinity for specified vector
> +	 */
> +	data = iocsr_read32(EIOINTC_REG_ROUTE + (vector & ~3));
> +	data &=  ~(0xff << ((vector & 3) * 8));
> +	data |= coremap << ((vector & 3) * 8);
> +	iocsr_write32(data, EIOINTC_REG_ROUTE + (vector & ~3));
> +	iocsr_write32(EIOINTC_ALL_ENABLE, regaddr);
> +	raw_spin_unlock_irqrestore(&affinity_lock, flags);
> +
> +	irq_data_update_effective_affinity(d, cpumask_of(cpu));
> +	return IRQ_SET_MASK_OK;
> +}
> +
>  static int eiointc_index(int node)
>  {
>  	int i;
> @@ -238,22 +280,39 @@ static struct irq_chip eiointc_irq_chip = {
>  	.irq_set_affinity	= eiointc_set_irq_affinity,
>  };
>  
> +static struct irq_chip eiointc_irq_chipi_single = {
> +	.name			= "EIOINTC-S",
> +	.irq_ack		= eiointc_ack_irq,
> +	.irq_mask		= eiointc_mask_irq,
> +	.irq_unmask		= eiointc_unmask_irq,
> +#ifdef CONFIG_SMP
> +	.irq_set_affinity       = eiointc_single_set_irq_affinity,
> +#endif
> +};
> +
>  static int eiointc_domain_alloc(struct irq_domain *domain, unsigned int virq,
>  				unsigned int nr_irqs, void *arg)
>  {
>  	int ret;
>  	unsigned int i, type;
>  	unsigned long hwirq = 0;
> -	struct eiointc *priv = domain->host_data;
> +	struct eiointc_priv *priv = domain->host_data;
> +	struct irq_chip *chip;
>  
>  	ret = irq_domain_translate_onecell(domain, arg, &hwirq, &type);
>  	if (ret)
>  		return ret;
>  
> -	for (i = 0; i < nr_irqs; i++) {
> -		irq_domain_set_info(domain, virq + i, hwirq + i, &eiointc_irq_chip,
> +	/*
> +	 * use simple irq routing method on single eiointc node
> +	 */
> +	if ((nr_pics == 1) && (nodes_weight(priv->node_map) == 1))
> +		chip = &eiointc_irq_chipi_single;
> +	else
> +		chip = &eiointc_irq_chip;
> +	for (i = 0; i < nr_irqs; i++)
> +		irq_domain_set_info(domain, virq + i, hwirq + i, chip,
>  					priv, handle_edge_irq, NULL, NULL);
> -	}
>  
>  	return 0;
>  }
> @@ -310,6 +369,7 @@ static void eiointc_resume(void)
>  	int i, j;
>  	struct irq_desc *desc;
>  	struct irq_data *irq_data;
> +	struct irq_chip *chip;
>  
>  	eiointc_router_init(0);
>  
> @@ -319,7 +379,8 @@ static void eiointc_resume(void)
>  			if (desc && desc->handle_irq && desc->handle_irq != handle_bad_irq) {
>  				raw_spin_lock(&desc->lock);
>  				irq_data = irq_domain_get_irq_data(eiointc_priv[i]->eiointc_domain, irq_desc_get_irq(desc));
> -				eiointc_set_irq_affinity(irq_data, irq_data->common->affinity, 0);
> +				chip = irq_data_get_irq_chip(irq_data);
> +				chip->irq_set_affinity(irq_data, irq_data->common->affinity, 0);
>  				raw_spin_unlock(&desc->lock);
>  			}
>  		}
> @@ -497,7 +558,14 @@ static int __init eiointc_of_init(struct device_node *of_node,
>  	priv->node = 0;
>  	priv->domain_handle = of_node_to_fwnode(of_node);
>  
> -	ret = eiointc_init(priv, parent_irq, 0);
> +	/*
> +	 * 2k0500 and 2k2000 has only one eiointc node
> +	 * set nodemap as 1 for simple irq routing
> +	 *
> +	 * Fixme: what about future embedded boards with more than 4 cpus?
> +	 * nodemap and node need be added in dts like acpi table
> +	 */
> +	ret = eiointc_init(priv, parent_irq, 1);
>  	if (ret < 0)
>  		goto out_free_priv;
>  

