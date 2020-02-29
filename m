Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAD8517447B
	for <lists+linux-mips@lfdr.de>; Sat, 29 Feb 2020 03:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgB2Cb2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 21:31:28 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17884 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726046AbgB2Cb2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 28 Feb 2020 21:31:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582943438;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=qcISkLAoEDfxjGzn/G+DLp8dKJ92NMAvFZrBu2ippfQ=;
        b=GnvNvuKhcJWMd1UZZys0aTbvcTZZKOrx4KidDIseWQdafZPD3QAgZakbYbQtpPBL
        YevLac1KX/R9c+7Y71VJR76e0fo3OFgID0qZ5FkUKJ+EQvYughdL5BDt3LcB4rJNnjo
        66qpzab0Ed+4fYGcefpSJcd9iGchNxsEMw1s5SbI=
Received: from mail.baihui.com by mx.zoho.com.cn
        with SMTP id 1582943436194402.55376640277996; Sat, 29 Feb 2020 10:30:36 +0800 (CST)
Date:   Sat, 29 Feb 2020 10:30:36 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     "Jiaxun Yang" <jiaxun.yang@flygoat.com>
Cc:     "linux-mips" <linux-mips@vger.kernel.org>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Jason Cooper" <jason@lakedaemon.net>,
        "Marc Zyngier" <maz@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Ralf Baechle" <ralf@linux-mips.org>,
        "Paul Burton" <paulburton@kernel.org>,
        "Huacai Chen" <chenhc@lemote.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Allison Randal" <allison@lohutok.net>,
        "linux-kernel" <linux-kernel@vger.kernel.org>,
        "devicetree" <devicetree@vger.kernel.org>
Message-ID: <1708ec7fda0.10809dfba20016.7421199916836672450@flygoat.com>
In-Reply-To: <20200221050942.507775-2-jiaxun.yang@flygoat.com>
References: <20200221050942.507775-1-jiaxun.yang@flygoat.com> <20200221050942.507775-2-jiaxun.yang@flygoat.com>
Subject: =?UTF-8?Q?=E5=9B=9E=E5=A4=8D:[PATCH_v4_01/10]_irqchip:_Add_driver_f?=
 =?UTF-8?Q?or_Loongson_I/O_Local_Interrupt_Controller?=
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

 ---- =E5=9C=A8 =E6=98=9F=E6=9C=9F=E4=BA=94, 2020-02-21 13:09:16 Jiaxun Yan=
g <jiaxun.yang@flygoat.com> =E6=92=B0=E5=86=99 ----
 > This controller appeared on Loongson family of chips as the primary
 > package interrupt source.
 >=20
 > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Any review/ack from irqchip subsystem?

Thanks.

 > ---
 >  drivers/irqchip/Kconfig                |   9 +
 >  drivers/irqchip/Makefile               |   1 +
 >  drivers/irqchip/irq-loongson-liointc.c | 338 +++++++++++++++++++++++++
 >  3 files changed, 348 insertions(+)
 >  create mode 100644 drivers/irqchip/irq-loongson-liointc.c

--
Jiaxun Yang
