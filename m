Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 994183E4FF9
	for <lists+linux-mips@lfdr.de>; Tue, 10 Aug 2021 01:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236397AbhHIXZg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Aug 2021 19:25:36 -0400
Received: from smtp2.de.opalstack.com ([139.162.136.213]:56164 "EHLO
        smtp2.de.opalstack.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233112AbhHIXZf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Aug 2021 19:25:35 -0400
X-Greylist: delayed 467 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Aug 2021 19:25:35 EDT
Received: from jason.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
        by smtp2.de.opalstack.com (Postfix) with ESMTPSA id 28644127909;
        Mon,  9 Aug 2021 23:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boddie.org.uk;
        s=dkim; t=1628551046;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ESqyDYqed0L+jmDAA13fMCcbg4AcR1LU+fD4aUu1PY4=;
        b=w4p/FItTz5sWMg+MXCDGPOwlTGas3+TeyXUdWEN22YWs/AOX3Q2efK6quHo6NR8ACw7NUM
        /3bqHZfraBQXTtD6Wswj6f7Gx/2SvMdQbPAlXhPUHhplvJR72/MlzpMbJ7dP3EwPtYM+OV
        tCyQmpw06Axbo/PyNVfjDERqsSu/rkE=
From:   Paul Boddie <paul@boddie.org.uk>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        David Airlie <airlied@linux.ie>,
        linux-mips <linux-mips@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, list@opendingux.net,
        Sam Ravnborg <sam@ravnborg.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: [Letux-kernel] [PATCH 8/8] drm/ingenic: Attach bridge chain to encoders
Date:   Tue, 10 Aug 2021 01:17:20 +0200
Message-ID: <2242071.3D3ZAXhqrE@jason>
In-Reply-To: <0TYKXQ.YAJ6UYG2GTXS1@crapouillou.net>
References: <20210808134526.119198-1-paul@crapouillou.net> <5DADB00D-1E0E-4B3A-86CE-4E98A5DC04DE@goldelico.com> <0TYKXQ.YAJ6UYG2GTXS1@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.52
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Monday, 9 August 2021 18:22:12 CEST Paul Cercueil wrote:
>=20
> Le lun., ao=FBt 9 2021 at 13:14:03 +0200, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> >
> > quick feedback: our HDMI on top compiles fine after fixing 2 merge
> > conflicts, but dos not yet work.
> > Will need some spare time with access to the CI20 board to research
> > the issue, i.e. can not give feedback immediately.
>=20
> Alright, no problem. I'll be back home in about 2 weeks and then I can
> test on my CI20 as well.

Just for reference, I looked into this initialisation failure. The HDMI=20
peripheral driver gets initialised satisfactorily...

dw-hdmi-ingenic 10180000.hdmi: Detected HDMI TX controller v1.31a with HDCP=
=20
(DWC HDMI 3D TX PHY)
dw-hdmi-ingenic 10180000.hdmi: registered DesignWare HDMI I2C bus driver

But then the reported error occurs in the DRM driver:

ingenic-drm 13050000.lcdc0: Unable to init connector
ingenic-drm: probe of 13050000.lcdc0 failed with error -22

This originates in a call to drm_bridge_connector_init from ingenic_drm_bin=
d:

connector =3D drm_bridge_connector_init(drm, encoder);

The invoked function iterates over the registered bridges, one of which see=
ms=20
to be the HDMI peripheral (it has bridge operations defined identically to=
=20
those specified in the Synopsys driver), but the type member of the drm_bri=
dge=20
structure is set to 0 (DRM_MODE_CONNECTOR_Unknown).

I might expect the bridge to expose a type acquired from its connector, but=
 I=20
don't see this propagation occurring in the Synopsys driver: dw_hdmi_probe=
=20
sets the bridge operations and other members of the drm_bridge structure, b=
ut=20
it doesn't set the type.

Also, it might be possible that dw_hdmi_connector_detect (exposed as the=20
detect operation) is not getting called, and this would explain why the=20
bridge's connector member does not have the connector_type set, either (sin=
ce=20
it is also set to 0).

Paul


