Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBCA1B018F
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 08:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbgDTG1b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 02:27:31 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17644 "EHLO
        sender2-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725812AbgDTG1b (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 02:27:31 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1587364046; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=OKswJTuuZSqOD6A9wG562C/dRQQ7lGj6AfKudmr3ntX61zar2i23p2KUjXVquzKATix4zitgPNK+GoCQscCLS6uKBWSxjlv7Wxn4m0a9rPbmtCX0WAIlYo2S4twzed/O61XFau3WHmo3vYy3B+zn6g2ID2+yQ5AjkrEkizXBZj0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1587364046; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=rzHxeVv28HFGCH6ZxIG0j5WfG/EiQ0MOksl9cuCiPpI=; 
        b=ZLLn8/wQUEOzo3RMdkPb1JkPrI+anTl/k615OGp4ooUKBMKnTqVQJiX15yM8TyZT5/j1kHsw+iuBkvtYdFmAHYo44ZF2abPpZtD9uCAwS+faxgCU5eN0CZP5YmgVZFIqtWSlreOqJd8OSHfLVBC8UMgqEcmyo3nVblw1dzBnYAY=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1587364046;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=rzHxeVv28HFGCH6ZxIG0j5WfG/EiQ0MOksl9cuCiPpI=;
        b=bvP774RTJizBvfupObDeIGVi9YS7iewliIGGu+LBoVixbR2gA+wQzh9Q5myrXozp
        zsbEISXBnKHrncC6wbsnvwtElFg+HqriXFBhhnkFmQpSzvrDTWlqd2BI+lOB4ecaMnD
        lWG1ZWd5WOpryAiDmF9h8U3q1lX/IFdDu2fWza4o=
Received: from [127.0.0.1] (115.205.241.167 [115.205.241.167]) by mx.zoho.com.cn
        with SMTPS id 1587364043724363.3375087529696; Mon, 20 Apr 2020 14:27:23 +0800 (CST)
Date:   Mon, 20 Apr 2020 14:27:21 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     David Bauer <mail@david-bauer.net>, devicetree@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mips: add missing ath79 SoCs
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <20200419172032.100463-1-mail@david-bauer.net>
References: <20200419172032.100463-1-mail@david-bauer.net>
Message-ID: <91171EE5-9983-4140-AE16-81A98204B89D@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B44=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
:20:32, David Bauer <mail@david-bauer=2Enet> =E5=86=99=E5=88=B0:
>The binding document was not updates since 2015=2E
>This adds Qualcomm Atheros SoCs which hit the market since then=2E

You'd better convert the whole binding into dt-schema[1] format=2E

Thanks=2E

[1]: https://lwn=2Enet/Articles/771621/

>
>Signed-off-by: David Bauer <mail@david-bauer=2Enet>
>---
> Documentation/devicetree/bindings/mips/ath79-soc=2Etxt | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/mips/ath79-soc=2Etxt b/Doc=
umentation/devicetree/bindings/mips/ath79-soc=2Etxt
>index 88a12a43e44e=2E=2E7dc56f26882a 100644
>--- a/Documentation/devicetree/bindings/mips/ath79-soc=2Etxt
>+++ b/Documentation/devicetree/bindings/mips/ath79-soc=2Etxt
>@@ -17,5 +17,11 @@ value must be one of the following values:
> - qca,ar9341
> - qca,ar9342
> - qca,ar9344
>+- qca,qca9531
>+- qca,qca9533
> - qca,qca9556
>+- qca,qca9557
> - qca,qca9558
>+- qca,qca9561
>+- qca,qca9563
>+- qca,tp9343

--=20
Jiaxun Yang
