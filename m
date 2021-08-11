Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E083E8BC3
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 10:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236088AbhHKI0S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 04:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236059AbhHKI0R (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Aug 2021 04:26:17 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65AA0C0613D3
        for <linux-mips@vger.kernel.org>; Wed, 11 Aug 2021 01:25:54 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g13so3928729lfj.12
        for <linux-mips@vger.kernel.org>; Wed, 11 Aug 2021 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h1pnCAwRASpn4fyPBkIzTBQEKpQcrtuBfGwIpH44ZSA=;
        b=qWzCe9dga955Cga5w7LhEv4Xk82pmQbdmUlVBdLOMkPX86nA8hsEPUdckpMeEV585/
         G/dHsMELydm5OjT26oiUny5UqrBwTXLpHaypWViqZiRfzgW9GyBz6wImoplFJnmPdjdk
         bNNETnaSu6mJlpsEDV1TY+nseYTNWxkdpkSG8R6Xj/sPBsX4+IWWcrcQ0eYfRbo034Hb
         9kqUs856OcyFHg57Tl4OIsE83+fin9YBLHRyuRn2mm/TCGPUX6bo4QZK8/PWJPQ1wiQK
         fZkbqvgtXKvYBnKcpuQKKBchXTBLHkVa8pIjfNXo4BQNKYHORgrE3Z5K2z7VX3kmUd/W
         TkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h1pnCAwRASpn4fyPBkIzTBQEKpQcrtuBfGwIpH44ZSA=;
        b=kr1CBHRpZ2kDLyB4a3qlzBciOCqZL/gSUjxmDGMWiSRUtIN1Us8lPKOAVbqaBO6W1J
         YZhX4BOi7d+ys4Ddy1nlp3UWH9LoaFFaFrqL1qFZ49kOpV2aw7nNx8lDDlCT79JoVYQl
         lllzSr8+RsGQ1pnXrwdV+Jd2PR+JHhbXnNw3jyWbuYzrlHHL8mH/9QtHciCZpMrNC/4M
         ws6umz2wNc7sCGgXM0NRdktlOGMEGnPoZiihilNevwBKP+pdbnU5CoOE1VifDm7p6gXQ
         MVdpi8D5kpYj4vNYtFeCO9IObWkEr24EEcSYcj3egTx9xNL5KEEIKPRh9Y+UN7E2BisJ
         DEPQ==
X-Gm-Message-State: AOAM533g7ozat7iyUxSobgv0a0UsPAvVY2BZXGT6ClsbjhFX12XDLQZR
        8GlD7asda5tELhdnix6OCEVBMUVIVeajH3bhY/fu6w==
X-Google-Smtp-Source: ABdhPJwzK1TTNyIYN73hVN5UaP15UGCZnTRveq/TFlaH8lMiEvIy1pw/7ZC1PP0URr0ybbS+xbh4JHIR63GJoVn1YpQ=
X-Received: by 2002:a19:c7cd:: with SMTP id x196mr24358039lff.465.1628670352818;
 Wed, 11 Aug 2021 01:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210717174836.14776-1-paul@crapouillou.net> <20210717174836.14776-3-paul@crapouillou.net>
In-Reply-To: <20210717174836.14776-3-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 10:25:42 +0200
Message-ID: <CACRpkdbMH5=r5wcxUrqL1DYPvERD6X+19699NwOrRT68tTU2oA@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: ingenic: Add .max_register in regmap_config
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jul 17, 2021 at 7:48 PM Paul Cercueil <paul@crapouillou.net> wrote:

> Compute the max register from the GPIO chip offset and number of GPIO
> chips.
>
> This permits to read all registers from debugfs.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Patch applied!

Yours,
Linus Walleij
