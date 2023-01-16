Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3FF166CF09
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jan 2023 19:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbjAPSnp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Jan 2023 13:43:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235103AbjAPSnV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Jan 2023 13:43:21 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 218701D915;
        Mon, 16 Jan 2023 10:37:43 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id r132so13502057oif.10;
        Mon, 16 Jan 2023 10:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bz6Srssb7KxtWIp2StQowmALBQ/ecYiEATmxxDpLUgE=;
        b=da/8FrC3su8n4920e9FOvu1j/TWeGMIAZK3QFppvkb8spsp70RYdvbMm2q6kr8fatp
         5ZhAWveL0+ghlV+yoW55uxO1VApqKx7SI3P9NQE44tN5xuWeO0ji9XuxwTvr/dlc9rsT
         tVUpF37v44gwmO7bLXKdtbiGDN/w5BQAj3xAbBkq52KC4lJdYL5HB8bnXAJ4+Its3plb
         v4Jme9uznTgidvg/tGOHCdyd7VszsqLeOpmjJn9xH6h/dQojHZTl8CSLKaqG/edls6PK
         yQ1U3V9Jp+1Ca32YYe1xYlqr5URZI2+ZvAQNN1kMuPpVWR6dfbhkvE0JUVZPCO257Kdu
         QMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bz6Srssb7KxtWIp2StQowmALBQ/ecYiEATmxxDpLUgE=;
        b=wota98mC58AH0TilsikpXKJZp4TABd66npGkOBBwryqewbZM9pc2emp9XZG1TydycI
         YnXeOIzaAGBrf97nnXWY+PG5SEbIuqA4nMRG+HBLM+EItpGcjVljvdeLXLLaTih7VtpC
         v/duyTFABGqZ48sks4vS6EJR6+8lpecGJglnOGT5Y6W8Cl+Xx8SU7LD7/Re5QFBh2hHM
         zdlfUkIg9x0syNNfJ81NQkyv71y7nwGqlGz4Kf1Q72v2h8q82pFmYRhZNwMiZ7AuSIoi
         fFRNDAUc8TCwHcdQJx9myEfJSlYKb0bg8+6b9xucUD/2cDbKhOYIWwE4JZpuOAaOaw6V
         jICw==
X-Gm-Message-State: AFqh2ko4+SzpSJi/sscDXz8cCkPj9ToxUlHw9yvvFG1jWMBVxW4YIL/q
        fkyF04XuxxV9RirQQgOAkvCrmoJiOOL8WcACc60=
X-Google-Smtp-Source: AMrXdXtOKveG9OHXqQHo9xNE/hNA9+TOjgR84/kFoTmzmkWJIw/wZWO6Z17PeC1Jr2qOmQVHIKAxEfu0US9MC60q0b0=
X-Received: by 2002:aca:2807:0:b0:35b:f5f7:3ed0 with SMTP id
 7-20020aca2807000000b0035bf5f73ed0mr17751oix.46.1673894262477; Mon, 16 Jan
 2023 10:37:42 -0800 (PST)
MIME-Version: 1.0
References: <20230116131235.18917-1-tzimmermann@suse.de> <87k01me9jn.fsf@intel.com>
In-Reply-To: <87k01me9jn.fsf@intel.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 16 Jan 2023 13:37:31 -0500
Message-ID: <CADnq5_PsL8N27_LC_h1m8i_FCg6mJtr7K9Yjv=guw-KGD2wU5w@mail.gmail.com>
Subject: Re: [PATCH 00/22] drm: Remove includes for drm_crtc_helper.h
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org,
        daniel@ffwll.ch, airlied@gmail.com, linux-aspeed@lists.ozlabs.org,
        nouveau@lists.freedesktop.org, linux-mips@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 16, 2023 at 11:20 AM Jani Nikula
<jani.nikula@linux.intel.com> wrote:
>
> On Mon, 16 Jan 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > A lot of source files include drm_crtc_helper.h for its contained
> > include statements. This leads to excessive compile-time dependencies.
> >
> > Where possible, remove the include statements for drm_crtc_helper.h
> > and include the required source files directly. Also remove the
> > include statements from drm_crtc_helper.h itself, which doesn't need
> > most of them.
> >
> > I built this patchset on x86-64, aarch64 and arm. Hopefully I found
> > all include dependencies.
>
> I think this is the right direction and I support this. Personally I
> think it's enough to build test and fix any fallout afterwards.
>
> To that end, I did build test this myself with my config, and it was
> fine, though that probably doesn't add much coverage.
>
> FWIW,
>
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Agreed.  I applied 1/22 since it was an unrelated cleanup, but the
rest of the series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
>
> --
> Jani Nikula, Intel Open Source Graphics Center
