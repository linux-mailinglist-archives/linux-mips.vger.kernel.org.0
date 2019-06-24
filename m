Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B67151EDC
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 00:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbfFXW6M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 18:58:12 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:32884 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbfFXW6L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Jun 2019 18:58:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1561417089; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=c2egTmXau6Vy6CT+7W8QNurfNWl4bPuu/kCpiH6J2sg=;
        b=i52y9r9VxZ68Ib8uF+AQrKLF6LKrkQ+QRLxcigEevTEYr+ofDFPcBaEcoNFFGVFNQwKUTs
        KnM5dMxvhRPksEYnOivorOiOGEKAEm8mOKSlNOMPtpNYnJ/ja4F+mamHDoi4OjwSaYNKOl
        OADXfkHoOeUOvm6mbcH3krPsEZWmPOs=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Mathieu Malaterre <malat@debian.org>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v13 00/13] Ingenic Timer/Counter Unit patchset v13
Date:   Tue, 25 Jun 2019 00:57:46 +0200
Message-Id: <20190624225759.18299-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

This is the version 13 of my patchset to support the Timer/Counter Unit
(TCU) present in JZ47xx SoCs from Ingenic.

Changelog:

Patch [03/13]:
 - Revert back to v11. Turns out it was okay.
 - Remove 'interrupt-parent' of the list of required properties.

Patch [05/13]:
 - Don't enable/disable the TCU clock on demand. Enable it in the probe
   and call it a day.
 - Register suspend callbacks to gate/ungate the TCU clock on
   suspend/resume.
 - Use pr_fmt and pr_crit instead of custom TCU_ERR() macro
 - Remove useless dependency on COMMON_CLK in Kconfig
 - Remove registration of clkdev

All the other patches have not been modified.
The patchset was rebased on 5.2-rc6.

Cheers,
-Paul


