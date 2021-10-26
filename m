Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4E0C43B9F8
	for <lists+linux-mips@lfdr.de>; Tue, 26 Oct 2021 20:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236813AbhJZSxA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Oct 2021 14:53:00 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:20282 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236853AbhJZSw6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Oct 2021 14:52:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1635274220;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=7ft8Vn6lPZYMUJ7yRwsizM95snAuobtCtLzV7BieLtc=;
    b=VEeFuwU6xodp2KD9GwJYEFXdI8WK8H+EoJeJyq93OkvqxMux0LdEzq28FwuWs6Eye8
    UCLVyE3y6a7pPyg/rUV9XqEs2hzlwNcwF+QlAf6E8sg4rMWXVDGLIOWC0OOdzYZyMzqI
    cGFcWWLbbpXQt/4M2RIXtHFheVtBaCr5f3FC0MkyHIiw8tjZnCU3rz7O27RR3hJwHutT
    MutBTYuH3GxjK8nYf78thTCgGPOToC46gZSeLanmMe20UoC6Mp8ypB8GOHy82ACtHGmH
    L0kUOf+FEHzgQAIekjPLgG0hW5M69gYBczzg5/8sVYZHgpNjxl0ejz0lDZvScjKbnbof
    SMHQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3i8J+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.1 SBL|AUTH)
    with ESMTPSA id d01d1fx9QIoJynM
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 26 Oct 2021 20:50:19 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [RESEND PATCH v3 0/6] drm/ingenic: Various improvements v3
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20211026181240.213806-1-paul@crapouillou.net>
Date:   Tue, 26 Oct 2021 20:50:19 +0200
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <4CBF748C-DA58-4E8B-A6E4-A7CE653F2C52@goldelico.com>
References: <20211026181240.213806-1-paul@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 26.10.2021 um 20:12 schrieb Paul Cercueil <paul@crapouillou.net>:
> 
> Hi,
> 
> I resend the V3 of my patchset for drm/ingenic, verbatim.
> 
> The previous submission of my V3 received a lot of replies, but none of
> these replies were actually talking about the patches themselves.

Indeed. And since we have finally managed to add jz4780 HDMI support
(I didn't find to work in the latest comments) on top of the series as is,
please go ahead and add my

tested-by: Nikolaus Schaller <hns@goldelico.com>

BR and thanks,
Nikolaus

> 
> Cheers,
> -Paul
> 
> 
> Paul Cercueil (6):
>  drm/ingenic: Simplify code by using hwdescs array
>  drm/ingenic: Add support for private objects
>  drm/ingenic: Move IPU scale settings to private state
>  drm/ingenic: Set DMA descriptor chain register when starting CRTC
>  drm/ingenic: Upload palette before frame
>  drm/ingenic: Attach bridge chain to encoders
> 
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 278 +++++++++++++++++-----
> drivers/gpu/drm/ingenic/ingenic-ipu.c     | 127 ++++++++--
> 2 files changed, 333 insertions(+), 72 deletions(-)
> 
> -- 
> 2.33.0
> 

