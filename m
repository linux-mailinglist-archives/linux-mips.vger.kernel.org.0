Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC29A4B501E
	for <lists+linux-mips@lfdr.de>; Mon, 14 Feb 2022 13:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353102AbiBNM3j convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 14 Feb 2022 07:29:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233868AbiBNM3j (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Feb 2022 07:29:39 -0500
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D7E49FA1;
        Mon, 14 Feb 2022 04:29:31 -0800 (PST)
Date:   Mon, 14 Feb 2022 12:29:18 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v15 1/7] drm/ingenic: Fix support for JZ4780 HDMI output
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Paul Boddie <paul@boddie.org.uk>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <maxime@cerno.tech>,
        Harry Wentland <harry.wentland@amd.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
        letux-kernel@openphoenux.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Message-Id: <U0OA7R.MYFTV5LL3N4A2@crapouillou.net>
In-Reply-To: <CD0193A3-4E97-4B26-9D1F-1CFAD5B18506@goldelico.com>
References: <cover.1644681054.git.hns@goldelico.com>
        <9d3a2000d2bb014f1afb0613537bdc523202135d.1644681054.git.hns@goldelico.com>
        <PQHA7R.CIX6XS4CFLMM3@crapouillou.net>
        <CD0193A3-4E97-4B26-9D1F-1CFAD5B18506@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le lun., f�vr. 14 2022 at 11:19:40 +0100, H. Nikolaus Schaller 
<hns@goldelico.com> a �crit :
> Hi Paul,
> 
> 
>>  Am 14.02.2022 um 11:13 schrieb Paul Cercueil <paul@crapouillou.net>:
>> 
>>  Hi,
>> 
>>  Le sam., f�vr. 12 2022 at 16:50:49 +0100, H. Nikolaus Schaller 
>> <hns@goldelico.com> a �crit :
>>>  From: Paul Boddie <paul@boddie.org.uk>
>>>  We have to make sure that
>>>  - JZ_LCD_OSDC_ALPHAEN is set
>>>  - plane f0 is disabled and not seen from user-space
>> 
>>  Actually it will still be seen from user-space, but it won't be 
>> possible to use it. So before applying I'll change this to:
>>  "plane f0 is disabled as it's not working yet"
>> 
>>  If that's OK with you.
> 
> Yes. You understand much better than me the implications...

I reworded it to "plane f0 is disabled as it's not working yet", added 
a Fixes: tag, and pushed this patch to drm-misc-next.

Cheers,
-Paul


