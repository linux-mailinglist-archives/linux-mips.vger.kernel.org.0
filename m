Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E673338BE1
	for <lists+linux-mips@lfdr.de>; Fri, 12 Mar 2021 12:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbhCLLwk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 12 Mar 2021 06:52:40 -0500
Received: from aposti.net ([89.234.176.197]:38758 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231352AbhCLLwP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Mar 2021 06:52:15 -0500
Date:   Thu, 11 Mar 2021 13:40:47 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 5/5] drm/ingenic: Add option to alloc cached GEM
 buffers
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Message-Id: <ZN4TPQ.4G2MK5P8EC4W2@crapouillou.net>
In-Reply-To: <20210311123040.GD1739082@infradead.org>
References: <20210307202835.253907-1-paul@crapouillou.net>
        <20210307202835.253907-6-paul@crapouillou.net>
        <20210311123040.GD1739082@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le jeu. 11 mars 2021 à 12:30, Christoph Hellwig <hch@infradead.org> a 
écrit :
> On Sun, Mar 07, 2021 at 08:28:35PM +0000, Paul Cercueil wrote:
>>  With the module parameter ingenic-drm.cached_gem_buffers, it is 
>> possible
>>  to specify that we want GEM buffers backed by non-coherent memory.
> 
> Shouldn't there be a way to discover this through a DT property?

Good question. My original way of thinking was that as this feature 
speeds up only software rendering, this is really 
application-dependent: a modern desktop where everything is rendered 
via the GPU wouldn't benefit much from it. With that in mind, it is 
fine as a module option.

On the other hand... the "software rendering is faster with 
non-coherent buffers" really is a SoC property, since it is only true 
for some generations of Ingenic SoCs and not others. So it would make 
sense to have a DT property for it.

-Paul


