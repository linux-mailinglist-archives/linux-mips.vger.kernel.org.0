Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5F621DB24D
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 13:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgETLwT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 07:52:19 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17746 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726224AbgETLwT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 May 2020 07:52:19 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1589975503; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=GfT1xh3tW+op1ejqTNjcpgDi0MrBuexm4GbeTF/eelkRK7yWnq8tg9juS5XP1ia8wjL69yfDK/56y54bVPJi1msf9MYSzOPe2NxQhpi0nOd4BLorpYhw8F94PRI1tgOtWmgpCQAAefWN+peiwbmzZx/0XeJPdbtLz1CDvNpbGog=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1589975503; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=ictEe6A1ntbqXb4Xzcdgn7ZvBdHoQtE5VuKky/cV41U=; 
        b=ZFQe82fEVscGFRFPCbKFgXa98gb4lQeMwcCe0lvDXv3deeXd8e2IquMsFOU62nAUtWP5oPgOknu1X6weJL7em9H/0+7YIYXTVr9VUXaogFwcHnlinLZ4f/8wPwEXUjHuHYuQ4k65j9f+hkzx+nxOi34kmhBaicxxqVhNOHsesko=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1589975503;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=ictEe6A1ntbqXb4Xzcdgn7ZvBdHoQtE5VuKky/cV41U=;
        b=fzp1wwwzDH/3SmtY/HwC1OVZ1jzJfbBXbbopDM8KDU4yoggwO99TaTC+k1CVyxuv
        YzHaQHA6Kx5zJdcWHcRPkl1YNAX+DjeBaKGo3HwVd1AH9JEztwMOyuqZZSdvxZY9R97
        eRZhor2U6C7BtVdsDsbqJaNEXn7VDrlHjJmB5yjc=
Received: from [127.0.0.1] (223.104.210.187 [223.104.210.187]) by mx.zoho.com.cn
        with SMTPS id 1589975500561839.4780833843952; Wed, 20 May 2020 19:51:40 +0800 (CST)
Date:   Wed, 20 May 2020 19:51:38 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Thomas Gleixner <tglx@linutronix.de>, maz@kernel.org
CC:     Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 5/6] irqchip: Add Loongson PCH MSI controller
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <871rno3uab.fsf@nanos.tec.linutronix.de>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com> <20200428063247.2223499-1-jiaxun.yang@flygoat.com> <20200428063247.2223499-5-jiaxun.yang@flygoat.com> <874ksk3uda.fsf@nanos.tec.linutronix.de> <871rno3uab.fsf@nanos.tec.linutronix.de>
Message-ID: <4324EED5-187D-4113-B7F2-DBF45C42AFFD@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=8813=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=888=
:15:40, Thomas Gleixner <tglx@linutronix=2Ede> =E5=86=99=E5=88=B0:
>Thomas Gleixner <tglx@linutronix=2Ede> writes:
>> Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom> writes:
>>> +
>>> +struct pch_msi_data {
>>> +	spinlock_t		msi_map_lock;
>>> +	phys_addr_t		doorbell;
>>> +	u32			irq_first;	/* The vector number that MSIs starts */
>>> +	u32			num_irqs;	/* The number of vectors for MSIs */
>>> +	unsigned long		*msi_map;
>>> +};
>>> +
>>> +static void pch_msi_mask_msi_irq(struct irq_data *d)
>>> +{
>>> +	pci_msi_mask_irq(d);
>>> +	irq_chip_mask_parent(d);
>>> +}
>>> +
>>> +static void pch_msi_unmask_msi_irq(struct irq_data *d)
>>> +{
>>> +	pci_msi_unmask_irq(d);
>>> +	irq_chip_unmask_parent(d);
>>
>> The ordering of mask and unmask is assymetric=2E That does not make sen=
se=2E
>>
>>> +static struct msi_domain_info pch_msi_domain_info =3D {
>>> +	=2Eflags		=3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
>>> +			  MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX,
>>> +	=2Echip	=3D &pch_msi_irq_chip,
>>
>> Please maintain tabular layout=2E
>
>Ooops=2E Wanted to reply to V3, but the comments are valid for V3 as well=
=2E

All fixed in v4=2E

Please review=2E

Thanks!


>
>Thanks,
>
>        tglx

--=20
Jiaxun Yang
