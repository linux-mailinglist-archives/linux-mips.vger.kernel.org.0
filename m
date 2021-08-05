Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD433E1D22
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 22:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239199AbhHEUFu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 5 Aug 2021 16:05:50 -0400
Received: from aposti.net ([89.234.176.197]:57792 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231184AbhHEUFu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Aug 2021 16:05:50 -0400
Date:   Thu, 05 Aug 2021 22:05:27 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] gpu/drm: ingenic: Add workaround for disabled drivers
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, list@opendingux.net,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Message-Id: <3HUDXQ.7RBGD4FUHR2F@crapouillou.net>
In-Reply-To: <YQw9hjZll4QmYVLX@kroah.com>
References: <20210805192110.90302-1-paul@crapouillou.net>
        <20210805192110.90302-3-paul@crapouillou.net> <YQw9hjZll4QmYVLX@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Greg,

Le jeu., août 5 2021 at 21:35:34 +0200, Greg Kroah-Hartman 
<gregkh@linuxfoundation.org> a écrit :
> On Thu, Aug 05, 2021 at 09:21:09PM +0200, Paul Cercueil wrote:
>>  When the drivers of remote devices (e.g. HDMI chip) are disabled in 
>> the
>>  config, we want the ingenic-drm driver to be able to probe 
>> nonetheless
>>  with the other devices (e.g. internal LCD panel) that are enabled.
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>> 
>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index d261f7a03b18..5e1fdbb0ba6b 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -1058,6 +1058,18 @@ static int ingenic_drm_bind(struct device 
>> *dev, bool has_components)
>>   	for (i = 0; ; i++) {
>>   		ret = drm_of_find_panel_or_bridge(dev->of_node, 0, i, &panel, 
>> &bridge);
>>   		if (ret) {
>>  +			/*
>>  +			 * Workaround for the case where the drivers for the
>>  +			 * remote devices are not enabled. When that happens,
>>  +			 * drm_of_find_panel_or_bridge() returns -EPROBE_DEFER
>>  +			 * endlessly, which prevents the ingenic-drm driver from
>>  +			 * working at all.
>>  +			 */
>>  +			if (ret == -EPROBE_DEFER) {
>>  +				ret = driver_deferred_probe_check_state(dev);
>>  +				if (ret == -ENODEV || ret == -ETIMEDOUT)
>>  +					continue;
>>  +			}
> 
> So you are mucking around with devices on other busses within this
> driver?  What could go wrong?  :(

I'm doing the same thing as everybody else. This is the DRM driver, and 
there is a driver for the external HDMI chip which gives us a DRM 
bridge that we can obtain from the device tree.

> Please use the existing driver core functionality for this type of
> thing, it is not unique, no need for this function to be called.

I'm not sure you understand what I'm doing here. This driver calls 
drm_of_find_panel_or_bridge(), without guarantee that the driver for 
the remote device (connected via DT graph) has been enabled in the 
kernel config. In that case it will always return -EPROBE_DEFER and the 
ingenic-drm driver will never probe.

This patch makes sure that the driver can probe if the HDMI driver has 
been disabled in the kernel config, nothing more.

Cheers,
-Paul


