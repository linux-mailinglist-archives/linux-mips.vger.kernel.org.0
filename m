Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C585E198AAF
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 05:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729834AbgCaDzo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 23:55:44 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17991 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727358AbgCaDzn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 23:55:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585626931;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=rj1HpV3ASlYUkr6huYlVr4mBpcCx559NMpVPDVrG8X4=;
        b=Iyto0/u6ndyWrImBk52R0ubhmL+eTqkDlRqgBQkMocJUaCNG8fi3zU1WrwOQzDyI
        GEVVfOEF69iNv98j3/SGMvSkhQYtLbcqBwz+Ti5sK8KCNqnbY26RmfZ7JqcCJBGGZP9
        MvSgQHgKgdGWpDmDghcIlVeKWyJuEWyKzCf2zxMA=
Received: from [10.233.233.252] (183.156.33.130 [183.156.33.130]) by mx.zoho.com.cn
        with SMTPS id 1585626928522601.4005423698948; Tue, 31 Mar 2020 11:55:28 +0800 (CST)
Date:   Tue, 31 Mar 2020 11:55:26 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <778df899-4dc4-c2be-5b7b-79c16223b0fb@loongson.cn>
References: <1585557531-18849-1-git-send-email-maobibo@loongson.cn> <53CC90A0-3926-4642-91D4-F4F265F6AE90@flygoat.com> <778df899-4dc4-c2be-5b7b-79c16223b0fb@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 02/39] MIPS: loongson64: Add header files path prefix
To:     maobibo <maobibo@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <00795E01-070C-4C45-AB33-A41058F6DD37@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8830=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=886=
:00:19, maobibo <maobibo@loongson=2Ecn> =E5=86=99=E5=88=B0:
>
>
>On 03/30/2020 04:55 PM, Jiaxun Yang wrote:
>>=20
>>=20
>> =E4=BA=8E 2020=E5=B9=B43=E6=9C=8830=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=884:38:51, bibo mao <maobibo@loongson=2Ecn> =E5=86=99=E5=88=B0:
>>> Remove header files from arch/mips/include/asm/mach-loongson64
>>> to arch/mips/loongson64/include/mach
>>>
>>> Signed-off-by: bibo mao <maobibo@loongson=2Ecn>
>>=20
>> Hi Bibo,
>>=20
>> Thanks for your patch=2E
>>=20
>> What's your intention?
>> Did you meet any problem about headers?
>>=20
>
>Hi Jiaxun,
>
>When I add irqchip support for mips kvm, file virt/kvm/irqchip=2Ec
>requires local header file arch/mips/kvm/irq=2Eh, it fails to compile=2E
>Since there is file with the same name located at:
>  arch/mips/include/asm/mach-generic/irq=2Eh
>  arch/mips/include/asm/mach-loongson64/irq=2Eh
>
>The compiler fails to choose the correct header file irq=2Eh,

btw: I checked Loongson's KVM implementation in their out-of-tree 3=2E10 k=
ernel and found they're emulating everything
in Kernel, like csr, irqchip of LS7A, extioi of 3A4000, even cpufreq=2E

This is making the whole thing unnecessarily complex=2E

If you are trying to mainline Loongson KVM support then please avoid do li=
ke this=2E

Please reference how Arm define their virt machine in QEMU=2E

We're not x86, we don't have to run into historical limitations=2E

Thanks

>
>regards
>bibo,mao
>
--=20
Jiaxun Yang
