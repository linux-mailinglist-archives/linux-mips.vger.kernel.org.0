Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92BC3E1952
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 18:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhHEQR5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 5 Aug 2021 12:17:57 -0400
Received: from aposti.net ([89.234.176.197]:38224 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229725AbhHEQR5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Aug 2021 12:17:57 -0400
Date:   Thu, 05 Aug 2021 18:17:32 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 8/8] [RFC] drm/ingenic: convert to component framework
 for jz4780 hdmi
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-Id: <8XJDXQ.X70C5WOD0QB7@crapouillou.net>
In-Reply-To: <BDF501D1-BA1D-4866-8EAF-3862F6CEC6F4@goldelico.com>
References: <cover.1628172477.git.hns@goldelico.com>
        <77554dd2612f418f6ab74a8be06c82b71410e0e6.1628172477.git.hns@goldelico.com>
        <YQv+DC5yTEGlJYuD@pendragon.ideasonboard.com>
        <BDF501D1-BA1D-4866-8EAF-3862F6CEC6F4@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus and Laurent,

Le jeu., août 5 2021 at 18:07:20 +0200, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> Hi Laurent,
> 
>>  Am 05.08.2021 um 17:04 schrieb Laurent Pinchart 
>> <laurent.pinchart@ideasonboard.com>:
>> 
>>  Hi Nikolaus,
>> 
>>  Thank you for the patch.
>> 
>>  On Thu, Aug 05, 2021 at 04:07:57PM +0200, H. Nikolaus Schaller 
>> wrote:
>>>  This patch attempts to convert the ingenic-dw-hdmi driver
>>>  into a version that uses the component framework.
>> 
>>  Why ? What problem would this solve ?
> 
> Well, it was suggested in a v1 we did post several months ago. I have 
> not
> looked up by whom and do not exactly remember the reasons.
> 
> We now simply thought that it is common style since dome dw-hdmi 
> drivers
> make use of it but some others don't. And we got it working without.
> 
> If it is not needed/requested by anyone, we can drop it from v3 (or 
> add later).

I don't remember exactly TBH - the only reason to use a component is to 
have access to the main driver's "drm_device" structure. The IPU needs 
it for instance, to register planes; but I don't think this HDMI driver 
needs it as it registers a bridge.

Cheers,
-Paul


