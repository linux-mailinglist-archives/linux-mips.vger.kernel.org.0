Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24A951A2FC3
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 09:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbgDIHKB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 03:10:01 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17833 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725283AbgDIHKA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 03:10:00 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586416166; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=Wobei5WInAshMdDygBVluMCD7o9t7TapeJXQK82SdObVJZK7WIRu1ef+g0DEdPKAb4NihMBgGC95mH/COHr2mDwhK5ftrFhLjlahVBYZkoZVs/cWazRrKafjahLVFr1ah/9yzzKp9doKPad27EQVbEOkmLMCi2MEgFaYDi082GY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586416166; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=Qa2n9evYcQirCgCpxB3IDp9QTiqPYtFJmnGql3MTeb8=; 
        b=P3bM1gBFwIY5AN1PVPkki5jLmeClwQNmRudkjeYe5Us0InylAecwEu/wVJfwqNBZy1boaYIOHWM8wEJFZ9tqUcuytIK3fKN9LR1VGJ5PQsfjiCagUsw2qtHdEhSH0YhM4a5oUbPV/s4ob/ayyxjpXQ5A7M8C2z9FsA8JRRQ17OU=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586416166;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=Qa2n9evYcQirCgCpxB3IDp9QTiqPYtFJmnGql3MTeb8=;
        b=Rn346rSUB56UKQTyGi9/TAn+tnlZa9mO9YJECtbdJu0t56UJPKRZVzcnIidSCzze
        VtIC9aWgAoJ3yr3d9ytiNbakVSw0tpzB3T+bgwQqaIxko6DwA1mvUyAWBT/XrjkPWdi
        75y5QlFet0/84yqaveSQpLa0G2VRtG9Sol53OgRk=
Received: from flygoat-x1e (122.235.212.87 [122.235.212.87]) by mx.zoho.com.cn
        with SMTPS id 1586416164370380.5460093713225; Thu, 9 Apr 2020 15:09:24 +0800 (CST)
Date:   Thu, 9 Apr 2020 15:09:23 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     YunQiang Su <wzssyqa@gmail.com>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Limit check_bugs32() under CONFIG_32BIT
Message-ID: <20200409150923.5b224361@flygoat-x1e>
In-Reply-To: <CAKcpw6XywbOs-rh5ko0uz9vLz9nkgrJ0LiRTSkQQaU9dZbg7oQ@mail.gmail.com>
References: <1586401829-22242-1-git-send-email-yangtiezhu@loongson.cn>
        <CAKcpw6XywbOs-rh5ko0uz9vLz9nkgrJ0LiRTSkQQaU9dZbg7oQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 9 Apr 2020 12:43:28 +0800
YunQiang Su <wzssyqa@gmail.com> wrote:

> Tiezhu Yang <yangtiezhu@loongson.cn> =E4=BA=8E2020=E5=B9=B44=E6=9C=889=E6=
=97=A5=E5=91=A8=E5=9B=9B
> =E4=B8=8A=E5=8D=8811:10=E5=86=99=E9=81=93=EF=BC=9A
> >
> > There is no need to build and call check_bugs32() under
> > CONFIG_64BIT, just limit it under CONFIG_32BIT. =20
>=20
> Since 32bit is subset of 64bit, and due to the code, I think that the
> initial purpose
> of check_bugs32() is also willing to run even with CONFIG_64BIT.
>=20
> For example, if we have a CPU which is 64bit, and work well on 64bit
> mode, while has a bug only on 32bit mode, check_bugs32 should be used
> here.
>=20
> Loongson's 3A 1000 is the example, I cannot support FP32 mode well.

In this case bugs32 only contains a workaround for MIPS34K, which is a
MIPS32 processor. It's safe to do so.

But my suggestion is if you're going to clean-up bugs and workarounds
you'd better establish a file for silicon bugs and provide Kconfig
options to enable & disable them. Manage bug dependencies by Kconfig
will be easier.

Thanks.

--
Jiaxun Yang
