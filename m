Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 473AA3E56E7
	for <lists+linux-mips@lfdr.de>; Tue, 10 Aug 2021 11:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236816AbhHJJcW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Aug 2021 05:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236673AbhHJJcV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Aug 2021 05:32:21 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36F8C0613D3
        for <linux-mips@vger.kernel.org>; Tue, 10 Aug 2021 02:31:59 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id m28-20020a05600c3b1cb02902b5a8c22575so2089717wms.0
        for <linux-mips@vger.kernel.org>; Tue, 10 Aug 2021 02:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Fq/OAyt9tR1z4LnLP6//tUkpUqlQ4V8PVc64GMxq34c=;
        b=FoY37oazvgJBwObkVJeS7apdeD0ExW53Tna+FSuiQK4P0tA0pxBfIFVNeXp/mYxLy1
         JTOmNxXkeraPJw/epdbG44H8BgWTvRiZrYrx+12/bsBmYc06OmTN7THcP+8+9wWk2u89
         i5eBj+6DBxjZY9v96ExCbIcUCRB5iFyjyJK84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=Fq/OAyt9tR1z4LnLP6//tUkpUqlQ4V8PVc64GMxq34c=;
        b=ZuUYwA9iVoLpI00hQxOelj0I6eFMizbQawtAoO2vDFjSekJm7gh4bZBq3b4b3T1Q1/
         W1DL890kl8gFmGWha+6o9qTQ9CYBu5+euGLyprEdpLRiAlYEv73Gcol80Q8ZuJBzaJ+n
         BNC8C6P0xGke0oviUSgelPUP646sC9PhmKhSkVnB1JhH9c4VDhfm4R8JGband236OhvY
         /EIYWTe1DiR32s8i1SF++R2Airp7NyT0C1JG5N4X85DSVPwOCyns+ckBMdunPLPFyC8z
         g2IE97qVCfzukzCYIn4GOd+f5T/unVGp9k07slTTeHam0LJUHckkXMj8WVPrZ7Q9GCIf
         lmww==
X-Gm-Message-State: AOAM532IqhBWJaM82U6WU9WCjLF+kSBEyAvilU0wd0yuUJP7MblsjDjW
        /Db6GKu5YH8eAAalVldtyYyXPQ==
X-Google-Smtp-Source: ABdhPJzvZkH5pcJd6qwMb5LXZEjwx9xzqNaGqoFLYYda0Vgzpy45V7iyyowtXSubND6b/zl1tYBDlQ==
X-Received: by 2002:a05:600c:2215:: with SMTP id z21mr14300862wml.141.1628587918406;
        Tue, 10 Aug 2021 02:31:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s13sm2186328wmc.47.2021.08.10.02.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 02:31:57 -0700 (PDT)
Date:   Tue, 10 Aug 2021 11:31:55 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Paul Boddie <paul@boddie.org.uk>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 8/8] [RFC] drm/ingenic: convert to component framework
 for jz4780 hdmi
Message-ID: <YRJHiydE2+6P81hg@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org, Paul Boddie <paul@boddie.org.uk>,
        Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org
References: <cover.1628172477.git.hns@goldelico.com>
 <77554dd2612f418f6ab74a8be06c82b71410e0e6.1628172477.git.hns@goldelico.com>
 <YQv+DC5yTEGlJYuD@pendragon.ideasonboard.com>
 <BDF501D1-BA1D-4866-8EAF-3862F6CEC6F4@goldelico.com>
 <8XJDXQ.X70C5WOD0QB7@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8XJDXQ.X70C5WOD0QB7@crapouillou.net>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 05, 2021 at 06:17:32PM +0200, Paul Cercueil wrote:
> Hi Nikolaus and Laurent,
> 
> Le jeu., août 5 2021 at 18:07:20 +0200, H. Nikolaus Schaller
> <hns@goldelico.com> a écrit :
> > Hi Laurent,
> > 
> > >  Am 05.08.2021 um 17:04 schrieb Laurent Pinchart
> > > <laurent.pinchart@ideasonboard.com>:
> > > 
> > >  Hi Nikolaus,
> > > 
> > >  Thank you for the patch.
> > > 
> > >  On Thu, Aug 05, 2021 at 04:07:57PM +0200, H. Nikolaus Schaller
> > > wrote:
> > > >  This patch attempts to convert the ingenic-dw-hdmi driver
> > > >  into a version that uses the component framework.
> > > 
> > >  Why ? What problem would this solve ?
> > 
> > Well, it was suggested in a v1 we did post several months ago. I have
> > not
> > looked up by whom and do not exactly remember the reasons.
> > 
> > We now simply thought that it is common style since dome dw-hdmi drivers
> > make use of it but some others don't. And we got it working without.
> > 
> > If it is not needed/requested by anyone, we can drop it from v3 (or add
> > later).
> 
> I don't remember exactly TBH - the only reason to use a component is to have
> access to the main driver's "drm_device" structure. The IPU needs it for
> instance, to register planes; but I don't think this HDMI driver needs it as
> it registers a bridge.

Imo for bridges/panels we really should move _away_ from component, not
towards it. If there's a gap in the bridge/panel api (I think there's some
patches floating around exactly to make this more a multi-step process for
reasons like the above) then we need to fix that.

Unfortunately the dw-hdmi and also dw-dsi drivers are very much built on
top of component.c and side-step the bridge stuff quite a lot. That
results in quite bad integration pains all around as we add more users of
these.

The other unfortunate thing is that there's not many people working in
this area, so fundamental improvements to the core design take a long time
to make and then even longer to roll out. It's a bit a tough spot, but
also, help very much welcome :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
