Return-Path: <linux-mips+bounces-6468-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A15E9B0FE9
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2024 22:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D120C1F2141D
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2024 20:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1140021443E;
	Fri, 25 Oct 2024 20:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IWxGcF2a"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F61217DFEC;
	Fri, 25 Oct 2024 20:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729888832; cv=none; b=b2qKV1CSf75hX421sjmvHkiST7MJEOpgU2rSbLeu+uHLeFfxh4gXyyvnls+yOLNdDfxpaMuLZ3FchHQaedgRrKwn9Ay8Oee474MnHZX619DLQT7Q8T0FWa0SuNyfO4/BpJlqeMVB92822PVa6jGpb9W2rGAKHzzhoP/L1K9+JGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729888832; c=relaxed/simple;
	bh=wrnRETKQ4YSgOhHYXSpv32z2hbqqzr8TLZ24YvIR7cs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iENNrxk4fj7I88uCezB0wZvkAUyX0b2RtH6rLlDfIfKQ7STXzt2z5iyraegZTh0oJddMPNI1RaYvG1G3sUyqBZeW8TAp8htDX+UF5zn/La3kn3TMENjtaEcQkmHN4mumWkgeXfI7EUdB58r5MY12LtdjX/d5nNC7AUiJTJC5eQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IWxGcF2a; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2F0DC0004;
	Fri, 25 Oct 2024 20:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729888824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8xq1CEYvKfazHRRqSvJNHsgXbDIHvVRxgJJhpycPiz4=;
	b=IWxGcF2aOI2alODIYwMNXrTahabVAsIXJZDF+rwKEIM39ZSJ3kyt7sR764Z1o70trh7S+x
	oHJuXhEYg0ajQCr56+z96wM7johTjaP/AH4fLS2aed7qvpbpd+VzUwhYgxJMT6ITDOgDxR
	02Yd8g870dF4kgfxMYPTTDCrhIHap7kmgmjlL3u4w3F+G/mX+vJpKdwKIaZxkU94yvkd2V
	MDoKOxOLJ/asYjuB1T+/jAmdsow450fbio0oY5vjtOEkn66Ekil2osfiVuejDg3n6Yt7Eo
	WzR13xM9qQ4WOSJNjRmMWsZpmUH9Pn0a8ijZfqMA0EiNeA2kd3iZIY1BzbAPBw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] irqchip: mips-gic: Handle case with cluster without CPU
 cores
In-Reply-To: <70b28614-e40e-4022-818b-80711c05c7a4@app.fastmail.com>
References: <20241025-no-cpu-cluster-support-v1-1-5e81fcf9f25c@bootlin.com>
 <70b28614-e40e-4022-818b-80711c05c7a4@app.fastmail.com>
Date: Fri, 25 Oct 2024 22:40:23 +0200
Message-ID: <87jzdvc3wo.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hi Jiaxun,

> =E5=9C=A82024=E5=B9=B410=E6=9C=8825=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8B=
=E5=8D=884:46=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>> It is possible to have no CPU cores in a cluster; in such cases, it is
>> not possible to access the GIC, and any indirect access leads to an
>> exception. This patch dynamically skips the indirect access in such
>> situations.
>
> Hi Gregory,
>
> I'm a little bit confused here, as I have never seen such wired configura=
tion.
>
> Is second cluster IOCU only?

Yes indeed in EyeQ5, the second cluster is the place for many
accelerator for vision that benefit of the L2 cache and of the coherency
unit.

Gregory

>
> Thanks
> - Jiaxun
>
>>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>> This patch is a follow-up of the series "MIPS: Support I6500
>> multi-cluster configuration"
>> https://lore.kernel.org/lkml/20241019071037.145314-1-arikalo@gmail.com/#t
>> ---
>>  drivers/irqchip/irq-mips-gic.c | 20 ++++++++++++++++----
>>  1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-g=
ic.c
>> index f42f69bbd6fb1..bca8053864b2c 100644
>> --- a/drivers/irqchip/irq-mips-gic.c
>> +++ b/drivers/irqchip/irq-mips-gic.c
>> @@ -141,7 +141,8 @@ static bool gic_irq_lock_cluster(struct irq_data *d)
>>  	cl =3D cpu_cluster(&cpu_data[cpu]);
>>  	if (cl =3D=3D cpu_cluster(&current_cpu_data))
>>  		return false;
>> -
>> +	if (mips_cps_numcores(cl) =3D=3D 0)
>> +		return false;
>>  	mips_cm_lock_other(cl, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
>>  	return true;
>>  }
>> @@ -507,6 +508,9 @@ static void gic_mask_local_irq_all_vpes(struct irq_d=
ata *d)
>>  	struct gic_all_vpes_chip_data *cd;
>>  	int intr, cpu;
>>=20
>> +	if (!mips_cps_multicluster_cpus())
>> +		return;
>> +
>>  	intr =3D GIC_HWIRQ_TO_LOCAL(d->hwirq);
>>  	cd =3D irq_data_get_irq_chip_data(d);
>>  	cd->mask =3D false;
>> @@ -520,6 +524,9 @@ static void gic_unmask_local_irq_all_vpes(struct=20
>> irq_data *d)
>>  	struct gic_all_vpes_chip_data *cd;
>>  	int intr, cpu;
>>=20
>> +	if (!mips_cps_multicluster_cpus())
>> +		return;
>> +
>>  	intr =3D GIC_HWIRQ_TO_LOCAL(d->hwirq);
>>  	cd =3D irq_data_get_irq_chip_data(d);
>>  	cd->mask =3D true;
>> @@ -687,8 +694,10 @@ static int gic_irq_domain_map(struct irq_domain=20
>> *d, unsigned int virq,
>>  	if (!gic_local_irq_is_routable(intr))
>>  		return -EPERM;
>>=20
>> -	for_each_online_cpu_gic(cpu, &gic_lock)
>> -		write_gic_vo_map(mips_gic_vx_map_reg(intr), map);
>> +	if (mips_cps_multicluster_cpus()) {
>> +		for_each_online_cpu_gic(cpu, &gic_lock)
>> +			write_gic_vo_map(mips_gic_vx_map_reg(intr), map);
>> +	}
>>=20
>>  	return 0;
>>  }
>> @@ -982,7 +991,7 @@ static int __init gic_of_init(struct device_node *no=
de,
>>  				change_gic_trig(i, GIC_TRIG_LEVEL);
>>  				write_gic_rmask(i);
>>  			}
>> -		} else {
>> +		} else if (mips_cps_numcores(cl) !=3D 0) {
>>  			mips_cm_lock_other(cl, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
>>  			for (i =3D 0; i < gic_shared_intrs; i++) {
>>  				change_gic_redir_pol(i, GIC_POL_ACTIVE_HIGH);
>> @@ -990,6 +999,9 @@ static int __init gic_of_init(struct device_node *no=
de,
>>  				write_gic_redir_rmask(i);
>>  			}
>>  			mips_cm_unlock_other();
>> +
>> +		} else {
>> +			pr_warn("No CPU cores on the cluster %d skip it\n", cl);
>>  		}
>>  	}
>>=20
>>
>> ---
>> base-commit: 10e44701486e25d630d714ace2b0c6d9a178b331
>> change-id: 20241025-no-cpu-cluster-support-1745e8abd7d1
>>
>> Best regards,
>> --=20
>> Gregory CLEMENT <gregory.clement@bootlin.com>
>
> --=20
> - Jiaxun

