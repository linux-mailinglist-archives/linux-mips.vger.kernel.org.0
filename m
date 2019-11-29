Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1442110D496
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2019 12:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbfK2LPc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Nov 2019 06:15:32 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:43438 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2LPc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Nov 2019 06:15:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1575026128; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DzZ99RLw6GpS1SHvSW1BYF+o4fdiAkHvONTbVZg7d1c=;
        b=pZGmPbNdEgmBegnl4174oxPD9/LtkPs2NOyJg2GkNx1t9i3TXEpAxR7N/uXIwunzPoGXrs
        4KPjirgPNBJFvBRhoQErZCAxhCAULc4NMdjJVAaXANSiqa4gsqM2YECwCH+NS1Wg13GbEW
        /vVYCSbeIu383FG6BqAfDEQS6gikA1E=
Date:   Fri, 29 Nov 2019 12:15:20 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: Add initial support for Ingenic X1000 SoC and Y&A CU Neo board
 v6.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        mripard@kernel.org, shawnguo@kernel.org, mark.rutland@arm.com,
        syq@debian.org, ralf@linux-mips.org, heiko@sntech.de,
        icenowy@aosc.io, laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, geert+renesas@glider.be,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Message-Id: <1575026120.3.1@crapouillou.net>
In-Reply-To: <1575017333-29020-1-git-send-email-zhouyanjie@zoho.com>
References: <1575017333-29020-1-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

This series need some reorder.

You introduce the defconfig in patch [03/12], then modify it in=20
[06/12], [08/12] and [10/12]. This just makes the patchset hard to=20
review and less likely to be merged.

Simply:
- Add missing X1000 nodes (pdma, mmc, rtc) in one patch,
- then add the CU Neo devicetree & config with PDMA, MMC and RTC=20
enabled.

And where are patches [11/12] and [12/12]? I didn't receive them.

Cheers,
-Paul



Le ven., nov. 29, 2019 at 16:48, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> v5->v6:
> 1.Use "stdout-path =3D "serial2:115200n8"" instead "stdout-path =3D=20
> &uart2" in DT.
> 2.Remove "console=3DttyS2,115200n8" and "CONFIG_CMDLINE_OVERRIDE=3Dy"=20
> from defconfg.
> 3.Add watchdog timer DT node, and update defconfig for watchdog timer.
>=20
>=20

=

