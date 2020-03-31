Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 092FC198A89
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 05:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbgCaDe5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 23:34:57 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17980 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727464AbgCaDe5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 23:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585625678;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=T/992S/NntFJbh2NBbKypuYLP245JSEjE8JiZ5fAzYI=;
        b=Ii7pSBPt9GwUXMWZzsty1l2gAA+RJbsbJbl6nRghPH6alLEbSxiFKCzFUBovO7nY
        Fhx9tuaSZGxHNlPXF9jfoNCIKWL7v3u0qytRKQqHy3liEmq7wiMxWc/E1pTQfx4N+4/
        vp9d9VV/AkbiKOdgxS0hEMCqdxiMc13d+GPBheaE=
Received: from mail.baihui.com by mx.zoho.com.cn
        with SMTP id 1585625676445695.6779755877686; Tue, 31 Mar 2020 11:34:36 +0800 (CST)
Date:   Tue, 31 Mar 2020 11:34:36 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     "maobibo" <maobibo@loongson.cn>
Cc:     "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Huacai Chen" <chenhc@lemote.com>,
        "linux-mips" <linux-mips@vger.kernel.org>,
        "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <1712ea7ba9a.dad1f80a33831.4741900511750683483@flygoat.com>
In-Reply-To: <778df899-4dc4-c2be-5b7b-79c16223b0fb@loongson.cn>
References: <1585557531-18849-1-git-send-email-maobibo@loongson.cn>
 <53CC90A0-3926-4642-91D4-F4F265F6AE90@flygoat.com> <778df899-4dc4-c2be-5b7b-79c16223b0fb@loongson.cn>
Subject: Re: [PATCH 02/39] MIPS: loongson64: Add header files path prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Priority: Medium
User-Agent: ZohoCN Mail
X-Mailer: ZohoCN Mail
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



--
Jiaxun Yang

 ---- =E5=9C=A8 =E6=98=9F=E6=9C=9F=E4=B8=80, 2020-03-30 18:00:19 maobibo <m=
aobibo@loongson.cn> =E6=92=B0=E5=86=99 ----
 >=20
 >=20
 > On 03/30/2020 04:55 PM, Jiaxun Yang wrote:
 > >=20
 > >=20
 > > =E4=BA=8E 2020=E5=B9=B43=E6=9C=8830=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=884:38:51, bibo mao <maobibo@loongson.cn> =E5=86=99=E5=88=B0:
 > >> Remove header files from arch/mips/include/asm/mach-loongson64
 > >> to arch/mips/loongson64/include/mach
 > >>
 > >> Signed-off-by: bibo mao <maobibo@loongson.cn>
 > >=20
 > > Hi Bibo,
 > >=20
 > > Thanks for your patch.
 > >=20
 > > What's your intention?
 > > Did you meet any problem about headers?
 > >=20
 >=20
 > Hi Jiaxun,
 >=20
 > When I add irqchip support for mips kvm, file virt/kvm/irqchip.c
 > requires local header file arch/mips/kvm/irq.h, it fails to compile.
 > Since there is file with the same name located at:
 >   arch/mips/include/asm/mach-generic/irq.h
 >   arch/mips/include/asm/mach-loongson64/irq.h
 >=20
 > The compiler fails to choose the correct header file irq.h,

You'd better rename kvm's irq.h in this case.

 >=20
 > regards
 > bibo,mao
 >=20
 > >> ---
 > >> arch/mips/Kconfig                                                 | 1=
 +
 > >> arch/mips/loongson64/Platform                                     | 2
 > >> +-
 > >> arch/mips/loongson64/env.c                                        | 8
 > >> ++++----

