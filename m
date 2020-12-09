Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3A52D3E08
	for <lists+linux-mips@lfdr.de>; Wed,  9 Dec 2020 10:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbgLIJAA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Dec 2020 04:00:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727218AbgLII75 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Dec 2020 03:59:57 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4E6C0613D6
        for <linux-mips@vger.kernel.org>; Wed,  9 Dec 2020 00:59:17 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id l11so2093201lfg.0
        for <linux-mips@vger.kernel.org>; Wed, 09 Dec 2020 00:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H4kdQcRfSBCbx7zGvesxGrfsAKDF4OGfaGjXFodrO74=;
        b=Nb0GkKIAm7dcqrmgsyIwJo38tasdPxkgHvt7bM04JX1NUdKS1KKXWNZ/f1q8kNK1Ak
         N5piWHNnX1Ci4zcrfsLQfTjHEvJ/nD7wBMuCwCjaCvGv6ziWmZjleawa5O6pjphDSdsx
         SZHGexSXGx7joKlWC0+GmJadETuk7cE+aZxxI+QktTZNcYwngVb50wGvJgU3u+7U6lCO
         ZJp9X+6uNncgp5DHiOIlBqPJFb1+PzoLTqIZmqqRtEk7rymNffpILx7NxzchmVAHxMNf
         cVl7zKsW3ByehxmxckIgQJ7UAl2YrgYuKzEemokel2bLqdnx+H4VEDE0vc799ZVn7PLh
         XX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H4kdQcRfSBCbx7zGvesxGrfsAKDF4OGfaGjXFodrO74=;
        b=iYqBZhQbuyxtx9XQIbiI8ntZK3vcIK56fHlJgD/+M0s39e2C9QyydcaEKnzdmTOP/4
         13hAlneozuDwZVfvg4fwt9ZjaOLWewL5WP8VsZziSVWJWK9E+NXqhWqdxrcA3G0dJSp0
         N651XCukVbX3WvLTRNToQgB3tjG/0/nk3D9c4ytKWGG/RkBy70zwDymRQ5C/hWl4/dsA
         8x+fWdh3jKgYBt/o59yp4SehWoj+aewJEvZLQQz/ZxZ+sKCA3iJXDEhLScP3HlNwoK9E
         3HeyE0Q8Lau3f0uDyzyVLSZOKoL8pZS6IDj9wgX7lSTjAfWQFq5AT6THtjU2JiIRiUPN
         6GyQ==
X-Gm-Message-State: AOAM532p5IGMtn+ZI1oUV0sIHZCaKDDSoFwRwlm4qMay2S8jaH7mBJ+K
        LUGS7Nx/tzDhCOlWfveQrXbLddG8O/PYZx+c39tZ0w==
X-Google-Smtp-Source: ABdhPJwHqLtksYEjPqnWu5i18QEvgN1JTjuURx6ecahj7/3lHvD3YQFzYlCPm2SD6tcxLCaRX/CcWXKFnMfDOnQpDeg=
X-Received: by 2002:a19:6557:: with SMTP id c23mr627191lfj.157.1607504355994;
 Wed, 09 Dec 2020 00:59:15 -0800 (PST)
MIME-Version: 1.0
References: <20201208164821.2686082-1-paul@crapouillou.net>
In-Reply-To: <20201208164821.2686082-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Dec 2020 09:59:05 +0100
Message-ID: <CACRpkdZFy8bvsV+HkzWsu0OKjg6i82o-mL+7v3_Ev5h_QR=xiA@mail.gmail.com>
Subject: Re: [PATCH 1/2] if_enabled.h: Add IF_ENABLED_OR_ELSE() and
 IF_ENABLED() macros
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Arnd Bergmann <arnd@kernel.org>, od@zcrc.me,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mips@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 8, 2020 at 5:48 PM Paul Cercueil <paul@crapouillou.net> wrote:

> Introduce a new header <linux/if_enabled.h>, that brings two new macros:
> IF_ENABLED_OR_ELSE() and IF_ENABLED().

I understand what the patch is trying to do, but when we already have
IS_ENABLED() in <linux/kconfig.h> this syntax becomes a big cognitive
confusion for the mind.

At least the commit needs to explain why it doesn't work to use
IS_ENABLED() instead so that this is needed.

Certainly the build failures must be possible to solve so that this
can live with the sibling IS_ENABLED() inside <linux/kconfig.h>,
it can't be too hard.

Yours,
Linus Walleij
