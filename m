Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4C5248EBC
	for <lists+linux-mips@lfdr.de>; Tue, 18 Aug 2020 21:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgHRTdI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Aug 2020 15:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726684AbgHRTdH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Aug 2020 15:33:07 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8CBEC061342
        for <linux-mips@vger.kernel.org>; Tue, 18 Aug 2020 12:33:06 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id b14so19413432qkn.4
        for <linux-mips@vger.kernel.org>; Tue, 18 Aug 2020 12:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9v9LH57+IfNt2arroNdfPSnoAN0s5S5MCTGnfuBn1wA=;
        b=nID6AIEUt87zPzVhsiu3zSRICoA8xdjdUmnpqUuhZDzIWO6fpU5q00kOORdeEDydV0
         +1pLQ+SOk2QtbtINMc46qLvmcGM1oX7xQVeE4tKTgqjnbI97bt5nXaj3Pn50/TQKbicn
         k7xX/uH3VKdJSYOWA53667Lh1bTJhecRepgu6hdfDY82F8HAvs8z2LIcaB4KmW4sHUIW
         YI+DvsiBHpEJMk45qfUo6ORkvcTLbS8LW3wzMW0mgPGdrL42G/P1KOESfw3YI17x1H8w
         AhzC0mI1zxDM9k0tpzD3QhbMKbs+16pKxNr6z0aVI+DL8DZaiU2PNbO4j/dWtdWVP4FH
         LaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9v9LH57+IfNt2arroNdfPSnoAN0s5S5MCTGnfuBn1wA=;
        b=P1LEP+Egbd/hWSFKcZ+sVl8Dq/2mvn60KwRAP87HwQl6IiRAvX+yCQQfPvV4FfmYty
         K68rJD7/5R+mBCZC5oW2gG1TzxZCdGM2hyAGbMuya+RtLExaR7mi+rdsY5g9p65TQCnt
         gD3fXTdxD+42T3kPG/XZ0bpK420DW5RcPDZl+RCwG54HJk3mIyoxiVNr4DSZ9zdeujWk
         NyMG1VBT9iuVxroo/ylTWR18j6BR9sBFTxK7hv5AaOZjrW6g0u9NLNwDrxuwjYkbA1Ef
         +kBsSRZEJdHOfdT/OYqsRd6eoD3RL4fy0DXw6I5lnArKdsrQygg/+4Wt+HLC2ZxUiK+P
         jjOg==
X-Gm-Message-State: AOAM53397xhKTHFMVaEEeGZEQY96c5i1NjMind+ZgKvivfA5BzgPVd2D
        xUnrRCjegwxZ9x04v985/czN6CHY3IsKzCp6qxlRbg==
X-Google-Smtp-Source: ABdhPJwmnD0GkDIn2RBiNaYhiNXsC+hVsNBfaZCb7bBepphu0Bkn4ovqkFMtTO4UzpqXIrzQAxfXXRicf60+wy+pB8s=
X-Received: by 2002:a37:a495:: with SMTP id n143mr19052701qke.330.1597779185970;
 Tue, 18 Aug 2020 12:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200814194847.3171-1-olek2@wp.pl>
In-Reply-To: <20200814194847.3171-1-olek2@wp.pl>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 18 Aug 2020 21:32:55 +0200
Message-ID: <CAMpxmJX2RWUaGnntxwyR+yNkeYo79cWhPJV8F9i=_Nz0yn+w6g@mail.gmail.com>
Subject: Re: [PATCH] gpio: stp-xway: automatically drive GPHY leds on ar10 and grx390
To:     Aleksander Jan Bajkowski <olek2@wp.pl>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 14, 2020 at 9:49 PM Aleksander Jan Bajkowski <olek2@wp.pl> wrote:
>
> Ar10 (xr300) has 3 and grx390 (xrx330) has 4 built-in GPHY. PHY LEDs are
> connected via STP. STP is a peripheral controller used to drive external
> shift register cascades. The hardware is able to allow the GPHY to drive
> some GPIO of the cascade automatically.This patch allows for this on ar10
> and grx390.
>
> Tested on D-Link DWR-966 with OpenWRT.
>
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---

Queued for v5.10, thanks!

Bartosz
