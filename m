Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B823372A4
	for <lists+linux-mips@lfdr.de>; Thu, 11 Mar 2021 13:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233166AbhCKMcK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Mar 2021 07:32:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbhCKMcA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 Mar 2021 07:32:00 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD923C061574;
        Thu, 11 Mar 2021 04:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=3dL2RTK5CP6zBocigTa8DXgh+MeDd98SDxYX1uvNwOI=; b=VwyAVKME/G5rGDh+TQFjhJXgo/
        +Cck6BxkuJwD+A1MeTHE51+M0h/041Gu6ZMAQb6pDLsj2lHKzQ0DIzN1LCB8Noh01NMLe5HfSbNPx
        Q2gNdZlV1FKrtX8+N+0Ki1DDR36M7H+7nMqyumifUGcNsSpO85TAjWf1voGK0+2Ug8HRlpkuXwF+w
        kojSpIKVTULxrqi3lOKsgv/uoGI2jcbLK+8niQiaEaWXNSIcaNk8Y4BznRP8hb9qcedwUv9TbWgXa
        B0hGo2P7y9BBdW4NtR3F9OXkpqyD2bToAq25QatBrkAK9Yi3uqUdARld/Y3EBw3EogmyoqwqSVE2f
        Z12PbQ3A==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lKKSe-007J1U-RQ; Thu, 11 Mar 2021 12:30:50 +0000
Date:   Thu, 11 Mar 2021 12:30:40 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm/ingenic: Add option to alloc cached GEM
 buffers
Message-ID: <20210311123040.GD1739082@infradead.org>
References: <20210307202835.253907-1-paul@crapouillou.net>
 <20210307202835.253907-6-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307202835.253907-6-paul@crapouillou.net>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Mar 07, 2021 at 08:28:35PM +0000, Paul Cercueil wrote:
> With the module parameter ingenic-drm.cached_gem_buffers, it is possible
> to specify that we want GEM buffers backed by non-coherent memory.

Shouldn't there be a way to discover this through a DT property?
