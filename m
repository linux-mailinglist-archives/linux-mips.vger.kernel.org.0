Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 220FB1A5277
	for <lists+linux-mips@lfdr.de>; Sat, 11 Apr 2020 16:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgDKOOl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 11 Apr 2020 10:14:41 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:31417 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgDKOOl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 11 Apr 2020 10:14:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586614477;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:Message-Id:Cc:Date:From:Subject:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=Y40ZjfNR5RQeKJlxlUDnzl8UAhefYWTC6w6r/2/VbF0=;
        b=nLnJCHnWKykhgvewbomGLfHWVVMO7938PRsf50z8EQu+Geqd9qCQS4UurGF54ud9vD
        xJVfC5BerQeNWi0gOrEVuZdVpjfI7KjCaMAiS6Z9Fux3lBRtfVl4bfEEd6JnesnJhafZ
        YfwQ0UYBtCHtfeOgs5AxOLFGKpQk0NOV3TUZlMAs3+L49x8HmzJdOrXPJEYFLqNCALdh
        0C/BP3E3lT/hsWaLqDT70IkxcA2CCeD0m6TSguwlwuMk2Ax68Nl0UMCCZ5k/RUC/hPK+
        Pscq7fDkjNAEwAzbFgfjCxVGKl/unkMEjq4KOmfZrhDydqqJKWc+pOTsApfNmr8cBoIv
        LeqQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlWdXAcJrw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w3BEET21q
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 11 Apr 2020 16:14:29 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: DRM interaction problems on Ingenic CI20 / jz4780 with dw-hdmi and ingenic-drm
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
Date:   Sat, 11 Apr 2020 16:14:29 +0200
Cc:     Paul Boddie <paul@boddie.org.uk>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>
Content-Transfer-Encoding: 7bit
Message-Id: <ED77DCA8-FF50-4E9E-A4B8-688262774723@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Dave Airlie <airlied@linux.ie>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yakir Yang <ykk@rock-chips.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,
we (Paul Boddie and me) are working to get HDMI functional on the
Ingenic CI20 board with jz4780 SoC which uses a specialization of
the dw-hdmi driver.


So far we have identified two issues.

The first is that HPD interrupts are not properly processed.

drm_helper_hpd_irq_event() is called by HPD events but
dev->mode_config.poll_enabled is false.

Therefore the interrupt is ignored and nothing happens.

Now I wonder about the logic behind checking for poll_enabled.
I understand that a driver can do either polling or irq or both.

Therefore handling the irq_event shouldn't be disabled by poll_enabled
being false. Otherwise we can only do: nothing, polling, polling+irq
but not irq alone.

The jz4780 hdmi subsystem (drm/bridge/dw-hdmi.c) uses

	connector->polled = DRM_CONNECTOR_POLL_HPD;

but shouldn't this enable polling? Note that there seems to be
no (direct) call to drm_kms_helper_poll_init().

If we set dev->mode_config.poll_enabled = true in
drm_helper_hpd_irq_event() things start to work.

Please can you clarify what would be best practise here to
get HPD event handling working.


The other issue is in dw-hdmi.c:

We found out that ingenic_drm_encoder_atomic_check() fails because

info->num_bus_formats == 0

and not 1. This blocks further initialization.

The reason seems to be that dw_hdmi_bridge_attach() does not call
drm_display_info_set_bus_formats() with a proper format like
other drivers (e.g. drm/bridge/ti-tfp410.c) are doing.

We have patched to set a single bus format MEDIA_BUS_FMT_RGB888_1X24
and then DRM setup seems to work (although we still have no valid
HDMI signal but that is likely something else).

Please can you explain how setting the bus format should be fixed
in dw-hdmi.c.

If these questions should be forwarded to other specialists, please
do so.


BR and thanks,
Nikolaus Schaller
