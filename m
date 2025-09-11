Return-Path: <linux-mips+bounces-11232-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8CBB529F3
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 09:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD2C34E2209
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 07:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BA326E704;
	Thu, 11 Sep 2025 07:29:42 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E902236FA;
	Thu, 11 Sep 2025 07:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757575782; cv=none; b=Tq+cLy/hPLI8wYlQwrC5Brvip7irDusJ5zF8p1/dCor4F7ugJi6VHd8JJgowln2Jm/L6EKbnMNV1ClDeulGCrwCyG4x2yvtt3yfo2UkXbgcbpMEnAfFcS0OPyK1BEku88LpdlHe3HzNF/SvQGvIjndFJ3L01Hh/ugbe+GU23DZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757575782; c=relaxed/simple;
	bh=FBcDb9WffmtxjndTke6DMs1Lll7pb+m3IIT1AjKzrTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQLMuU8mR5fGvCHd3kwY/kVjY34bjLHaGDQoKlN55ajs1AE2QFh1PEQcMxRXdd7t9b7Pv0/E8v1pAeIY9xhSpdkth/yfYJCLwJe+n+l4vXsdN93fSvrDkGrQc7xOCogVEh8uCAm28Cw053Vgi0IhFCJsag3lwlk457IdFFGEJ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [124.127.222.9])
	by gateway (Coremail) with SMTP id _____8DxO9JZesJoux8JAA--.19313S3;
	Thu, 11 Sep 2025 15:29:29 +0800 (CST)
Received: from [127.0.0.1] (unknown [124.127.222.9])
	by front1 (Coremail) with SMTP id qMiowJCx3sFYesJoOouNAA--.41628S2;
	Thu, 11 Sep 2025 15:29:28 +0800 (CST)
Message-ID: <fb4e8ee2-ff13-4446-aa23-57f0332d0342@loongson.cn>
Date: Thu, 11 Sep 2025 15:29:27 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/loongson-pch-lpc: Use legacy domain for PCH-LPC
 IRQ controller
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250909125840.638418-1-wangming01@loongson.cn>
 <CAAhV-H4NDsrvuPH2o1D=UzTTH13Q62YxcHCZLN-QvZ2Dc5qEqw@mail.gmail.com>
Content-Language: en-US
From: Ming Wang <wangming01@loongson.cn>
In-Reply-To: <CAAhV-H4NDsrvuPH2o1D=UzTTH13Q62YxcHCZLN-QvZ2Dc5qEqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx3sFYesJoOouNAA--.41628S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAQECEmjCZKYBxwAAs+
X-Coremail-Antispam: 1Uk129KBj93XoWxWrWfZF1kuryUJw4Uur47ZFc_yoWrAryrpF
	45Ga9F9rZ8JF1UA3ZxCw10vryfA3s5t3y2ya1FkwnxAr9xZ3sY9F4jkFn09ryxAF98X3W7
	Zr4jqFW8uF1YkFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
	xGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8ctx3UUUUU=
	=

Hi Huacai,

On 9/11/25 12:49, Huacai Chen wrote:
> Hi, Wangming,
> 
> On Tue, Sep 9, 2025 at 8:58 PM Ming Wang <wangming01@loongson.cn> wrote:
>>
>> On certain Loongson platforms, drivers attempting to request a legacy
>> ISA IRQ directly via request_irq() (e.g., IRQ 4) may fail. The
>> virtual IRQ descriptor is not fully initialized and lacks a valid irqchip.
>>
>> This issue does not affect ACPI-enumerated devices described in DSDT,
>> as their interrupts are properly mapped via the GSI translation path.
>> This indicates the LPC irqdomain itself is functional but is not correctly
>> handling direct VIRQ-to-HWIRQ mappings.
>>
>> The root cause is the use of irq_domain_create_linear(). This API sets
>> up a domain for dynamic, on-demand mapping, typically triggered by a GSI
>> request. It does not pre-populate the mappings for the legacy VIRQ range
>> (0-15). Consequently, if no ACPI device claims a specific GSI
>> (e.g., GSI 4), the corresponding VIRQ (e.g., VIRQ 4) is never mapped to
>> the LPC domain. A direct call to request_irq(4, ...) then fails because
>> the kernel cannot resolve this VIRQ to a hardware interrupt managed by
>> the LPC controller.
> If we create a legacy domain, the VIRQ0~15 are pre-allocated, then an
> ACPI device claims GSI 4, what will happen?
There will be no conflict. When the ACPI GSI mapping function is called,
it first uses irq_find_mapping() to check for an existing mapping.

Since the legacy domain has already created the mapping, the lookup
will succeed. The function will then simply return the existing VIRQ 4,
bypassing any new allocation logic.

The simplified call flow for an ACPI device claiming GSI 4 (after my patch)
is as follows:

acpi_register_gsi(..., .gsi=4, ...)
   -> irq_create_fwspec_mapping(fwspec)
     -> domain = irq_find_matching_fwspec(...)  // Finds lpc_domain
     -> irq_domain_translate(...)               // Translates fwspec to 
hwirq=4
     -> virq = irq_find_mapping(lpc_domain, 4)  // SUCCESS, finds 
existing VIRQ 4
     -> return virq;                            // Returns 4

> 
>>
>> The PCH-LPC interrupt controller is an i8259-compatible legacy device
>> that requires a deterministic, static 1-to-1 mapping for IRQs 0-15 to
>> support legacy drivers.
>>
>> Fix this by replacing irq_domain_create_linear() with
>> irq_domain_create_legacy(). This API is specifically designed for such
>> controllers. It establishes the required static 1-to-1 VIRQ-to-HWIRQ
>> mapping for the entire legacy range (0-15) immediately upon domain
>> creation. This ensures that any VIRQ in this range is always resolvable,
>> making direct calls to request_irq() for legacy IRQs function correctly.
>>
>> Signed-off-by: Ming Wang <wangming01@loongson.cn>
>> ---
>>   drivers/irqchip/irq-loongson-pch-lpc.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-loongson-pch-lpc.c b/drivers/irqchip/irq-loongson-pch-lpc.c
>> index 2d4c3ec128b8..68b09cc8c400 100644
>> --- a/drivers/irqchip/irq-loongson-pch-lpc.c
>> +++ b/drivers/irqchip/irq-loongson-pch-lpc.c
>> @@ -200,8 +200,13 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent,
>>                  goto iounmap_base;
>>          }
>>
>> -       priv->lpc_domain = irq_domain_create_linear(irq_handle, LPC_COUNT,
>> -                                       &pch_lpc_domain_ops, priv);
>> +       /*
>> +        * The LPC interrupt controller is a legacy i8259-compatible device,
>> +        * which requires a static 1:1 mapping for IRQs 0-15.
>> +        * Use irq_domain_create_legacy to establish this static mapping early.
> irq_domain_create_legacy()
OK, I will fix it in the v2 patch.

> 
>> +        */
>> +       priv->lpc_domain = irq_domain_create_legacy(irq_handle, LPC_COUNT, 0, 0,
>> +                       &pch_lpc_domain_ops, priv);
> The recommended indentation is:
>         priv->lpc_domain = irq_domain_create_legacy(irq_handle, LPC_COUNT, 0, 0,
> 
>                     &pch_lpc_domain_ops, priv);
> 
> which means "&" is below "irq_handle".

You are right. I will fix the indentation in the v2 patch.

Thanks,
Ming

> 
> Huacai
> 
>>          if (!priv->lpc_domain) {
>>                  pr_err("Failed to create IRQ domain\n");
>>                  goto free_irq_handle;
>> --
>> 2.43.0
>>


