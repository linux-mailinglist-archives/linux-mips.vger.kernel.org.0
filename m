Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356EA338BE2
	for <lists+linux-mips@lfdr.de>; Fri, 12 Mar 2021 12:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbhCLLwj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 12 Mar 2021 06:52:39 -0500
Received: from aposti.net ([89.234.176.197]:38676 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231423AbhCLLwJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Mar 2021 06:52:09 -0500
Date:   Thu, 11 Mar 2021 12:33:31 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 4/5] drm: Add and export function drm_gem_cma_sync_data
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Message-Id: <VJ1TPQ.L5I3WNCQNB982@crapouillou.net>
In-Reply-To: <20210311122846.GC1739082@infradead.org>
References: <20210307202835.253907-1-paul@crapouillou.net>
        <20210307202835.253907-5-paul@crapouillou.net>
        <20210311122846.GC1739082@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le jeu. 11 mars 2021 à 12:28, Christoph Hellwig <hch@infradead.org> a 
écrit :
> On Sun, Mar 07, 2021 at 08:28:34PM +0000, Paul Cercueil wrote:
>>  +	drm_atomic_for_each_plane_damage(&iter, &clip) {
>>  +		for (i = 0; i < finfo->num_planes; i++) {
>>  +			daddr = drm_fb_cma_get_gem_addr(state->fb, state, i);
>>  +
>>  +			/* Ignore x1/x2 values, invalidate complete lines */
>>  +			offset = clip.y1 * state->fb->pitches[i];
>>  +
>>  +			dma_sync_single_for_device(dev, daddr + offset,
>>  +				       (clip.y2 - clip.y1) * state->fb->pitches[i],
>>  +				       DMA_TO_DEVICE);
> 
> Are these helpers only ever used to transfer data to the device and
> never from it?  If so please clearly document that.

Yes. In the DRM world, are there cases where we transfer data from the 
device? I assume these cases are handled by v4l2 instead.

-Paul


