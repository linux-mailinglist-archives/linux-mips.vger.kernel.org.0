Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922F3346452
	for <lists+linux-mips@lfdr.de>; Tue, 23 Mar 2021 17:04:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232848AbhCWQDp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 23 Mar 2021 12:03:45 -0400
Received: from aposti.net ([89.234.176.197]:41698 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232492AbhCWQDP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 23 Mar 2021 12:03:15 -0400
Date:   Tue, 23 Mar 2021 16:03:00 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 0/4] Fixes to bridge/panel and ingenic-drm
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Message-Id: <09JFQQ.5A8HP2TTVT5Z1@crapouillou.net>
In-Reply-To: <DUC1PQ.KO33KJE3BP5L@crapouillou.net>
References: <20210124085552.29146-1-paul@crapouillou.net>
        <DUC1PQ.KO33KJE3BP5L@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le mer. 24 févr. 2021 à 13:44, Paul Cercueil <paul@crapouillou.net> a 
écrit :
> Hi,
> 
> Some feedback for patches 1-3? Laurent?

1-month anniversary ping :)

Cheers,
-Paul

> Cheers,
> -Paul
> 
> 
> Le dim. 24 janv. 2021 à 8:55, Paul Cercueil <paul@crapouillou.net> a 
> écrit :
>> Hi,
>> 
>> Here are three independent fixes. The first one addresses a
>> use-after-free in bridge/panel.c; the second one addresses a
>> use-after-free in the ingenic-drm driver; finally, the third one 
>> makes
>> the ingenic-drm driver work again on older Ingenic SoCs.
>> 
>> Changes from v2:
>> - patch [1/4] added a FIXME.
>> - patch [2/4] is new. It introduces a 
>> drmm_plain_simple_encoder_alloc()
>>   macro that will be used in patch [3/4].
>> - patch [3/4] uses the macro introduced in patch [2/4].
>> - patch [4/4] is unmodified.
>> 
>> Note to linux-stable guys: patch [v2 2/3] will only apply on the 
>> current
>> drm-misc-next branch, to fix it for v5.11 and older kernels, use the 
>> V1
>> of that patch.
>> 
>> Cheers,
>> -Paul
>> 
>> Paul Cercueil (4):
>>   drm: bridge/panel: Cleanup connector on bridge detach
>>   drm/simple_kms_helper: Add macro drmm_plain_simple_encoder_alloc()
>>   drm/ingenic: Register devm action to cleanup encoders
>>   drm/ingenic: Fix non-OSD mode
>> 
>>  drivers/gpu/drm/bridge/panel.c            | 12 +++++++++++
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 26 
>> +++++++++++------------
>>  include/drm/drm_simple_kms_helper.h       | 17 +++++++++++++++
>>  3 files changed, 42 insertions(+), 13 deletions(-)
>> 
>> --
>> 2.29.2
>> 
> 


