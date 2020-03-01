Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49D3A174C17
	for <lists+linux-mips@lfdr.de>; Sun,  1 Mar 2020 07:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbgCAGjV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Mar 2020 01:39:21 -0500
Received: from [115.28.160.31] ([115.28.160.31]:44320 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1725787AbgCAGjV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Mar 2020 01:39:21 -0500
Received: from ld50.lan (unknown [112.64.119.125])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 00B5A600D6;
        Sun,  1 Mar 2020 14:39:10 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1583044751; bh=cpjItaSHYfU7pyGGm7Proa2bOdjhGTQqNPsYpnL8Kbc=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=CF8j1L8EQJjpCQC+GHWLMuW7ZvzAxOzkF/bN/n3ESEAumhzLnPEBu9gzimXAQ6MTd
         ihNgTDgFjKkWnK61PF7HU/AYQQPRGmwZGEhm1kthEmawmyJ1OJrAs76M6c+TzHQQOH
         0KdNi9CRBhylgiw4F9q9JWTnALUOzk8GK1j6QJkE=
Date:   Sun, 1 Mar 2020 14:39:05 +0800
From:   WANG Xuerui <git@xen0n.name>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: Re: MIPS Hardware support
Message-ID: <20200301063905.GA8727@ld50.lan>
References: <20200227144910.GA25011@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200227144910.GA25011@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

I'm doing the occasional Linux/MIPS tinkering in my spare time, mainly
with Loongson machines. I have the following MIPS hardware:

Hardware I own and regularly boot current kernels:

- Loongson 3A3000 + RS780E development board (MACH_LOONGSON64)

This is the box I regularly rebase and test my patches with.

Hardware I own but not booted for a while:

- Lemote Yeeloong 8089D netbook (Loongson 2F, MACH_LOONGSON2EF)
- Loongson 3A2000 + RS780E development board (MACH_LOONGSON64)

These two have mainline support.

Hardware I own but not running up-to-date mainline kernels:

- OpenLoongson development board (Loongson 1C, MACH_LOONGSON32)
- Loongson Pi 2 (Loongson 2K1000 SoC, MACH_LOONGSON64)
- Loongson 3A3000 + 7A1000 development board (MACH_LOONGSON64)
- Loongson 3A4000 + 7A1000 development board (MACH_LOONGSON64)

These boards all lack mainline support. Some are in progress, like the
Modernize Loongson Machine patchset by Jiaxun that eventually leads to
mainline 7A support.

Both of my two routers happen to be MIPS-based too, with QCA9558 (ATH79)
and MT7621 (RALINK) inside respectively, but I'm unlikely to mess with
them at the moment.

--
WANG Xuerui
