Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B570138956
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 02:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbgAMBr5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 20:47:57 -0500
Received: from forward103o.mail.yandex.net ([37.140.190.177]:40499 "EHLO
        forward103o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727222AbgAMBr5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 20:47:57 -0500
Received: from mxback10o.mail.yandex.net (mxback10o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::24])
        by forward103o.mail.yandex.net (Yandex) with ESMTP id 377F65F80487;
        Mon, 13 Jan 2020 04:47:54 +0300 (MSK)
Received: from myt6-efff10c3476a.qloud-c.yandex.net (myt6-efff10c3476a.qloud-c.yandex.net [2a02:6b8:c12:13a3:0:640:efff:10c3])
        by mxback10o.mail.yandex.net (mxback/Yandex) with ESMTP id ygvO1sjgVw-lqrmCHnr;
        Mon, 13 Jan 2020 04:47:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578880074;
        bh=PLhMpYqOw4aw3N/8SD58bKwThXqXU7ZtZuisIgPcR10=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=a3XVq9sFcup/ZfB098XaM8DneoIw++AYw7y3/MYiShaIXfSHbNXwNusycdsu1luln
         AZPaxMABplS/QvwSqgNtEypHlyIXd8Y9iEQ9B7FzZorSQmbmp8L4+4p/HLNnzWgG2u
         XMu1fk/gRYZnHdL3yIRWYJ6Wz39xJdH+NaI1RPng=
Authentication-Results: mxback10o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt6-efff10c3476a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id plB9c1Sp5E-loWSxFax;
        Mon, 13 Jan 2020 04:47:50 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Mon, 13 Jan 2020 09:47:45 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <1578647320-14391-2-git-send-email-lixing@loongson.cn>
References: <1578647320-14391-1-git-send-email-lixing@loongson.cn> <1578647320-14391-2-git-send-email-lixing@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] KVM: MIPS: Fixup VPN2_MASK definition over 32bits virtual address
To:     Xing Li <lixing@loongson.cn>, Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <1E098715-90D3-4732-8F6D-1ED88D06F96C@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B41=E6=9C=8810=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=885=
:08:39, Xing Li <lixing@loongson=2Ecn> =E5=86=99=E5=88=B0:
>If the cpu support more than 32bits vmbits, VPN2_MASK set to fixed
>0xffffe000 will lead to wrong entryhi for _kvm_mips_host_tlb_inv
>
>Signed-off-by: Xing Li <lixing@loongson=2Ecn>
>---
> arch/mips/include/asm/kvm_host=2Eh | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/arch/mips/include/asm/kvm_host=2Eh
>b/arch/mips/include/asm/kvm_host=2Eh
>index 6be70d5=2E=2Ece9546c 100644
>--- a/arch/mips/include/asm/kvm_host=2Eh
>+++ b/arch/mips/include/asm/kvm_host=2Eh
>@@ -274,7 +274,12 @@ enum emulation_result {
> #define MIPS3_PG_SHIFT		6
> #define MIPS3_PG_FRAME		0x3fffffc0
>=20
>+#if defined(CONFIG_64BIT)
>+#define VPN2_MASK		(((1UL << cpu_vmbits) - 1) &	\
>+						   0x3fffffffffffe000UL)
>+#else
> #define VPN2_MASK		0xffffe000

Hi Lixing,
It could be more reasonable to do like:

#define VPN2_MASK GENMASK(vm_bits, 13)

So we can avoid ugly ifdef=2E

Thanks


>+#endif
> #define KVM_ENTRYHI_ASID	cpu_asid_mask(&current_cpu_data)
> #define TLB_IS_GLOBAL(x)	((x)=2Etlb_lo[0] & (x)=2Etlb_lo[1] & ENTRYLO_G)
> #define TLB_VPN2(x)		((x)=2Etlb_hi & VPN2_MASK)

--=20
Jiaxun Yang
