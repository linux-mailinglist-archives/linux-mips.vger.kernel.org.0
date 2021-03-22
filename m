Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3345344C81
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 18:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhCVQ7k (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 12:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbhCVQ7c (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Mar 2021 12:59:32 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0BC4C061574;
        Mon, 22 Mar 2021 09:59:30 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id g38so7308989ybi.12;
        Mon, 22 Mar 2021 09:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MzN/sXQ/XVj/NfU+6jTmm5tb6uOktbF1W0iQRoG8Y7A=;
        b=TJNZDtQK2o1+m7Mu3JT2bmqRgA/Rc0Dae5WKN+20czRJI167N6a5JxozNzp+Su6Cp/
         rt9L981xUs8ZVBxDmrAG9vdRLP3NkT7Rwj/FaGvkQ3vRa5mGeEdsW+pTFYveHet77Hm4
         LC6VLvv+ZbQEd6dHkKFoccEeQgX/6RIMHZUHXUZe97dtLHvbXP7CEN2ugp7Ti4zxfzNx
         xa+q/GbjOQXVX5M7tqj62srB34xRL4eWo747HPSh6CN+FjZL9UqKTLcgnrXkoB0umkNz
         pOeL+3vvVG4cS+8+7MaTFoJn9pO9Rabn3yKHxKZH/r36lMm9KJH/MzFPxoDrDtfXvB1z
         u/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MzN/sXQ/XVj/NfU+6jTmm5tb6uOktbF1W0iQRoG8Y7A=;
        b=YjGYkfM1RcVOve08q/jDjn1YQ0aSAgS++vMZJK2rLFLesCD8ZhrKIr7Miacl+iwzCc
         jf/jFn+8/ouGbap3PUzF65Dxx2z6Q7KD51J4U0IHehW3vh4IDQ2NJ00mXeLhjHdGfbbj
         R65OM7JoCo8LMnqU6Uvl2I9K4mD/BErqQbHKVlriy4q6VExLprrzaZK8AF58p7EDzi3b
         I4EJGTu4JUryaDfJiYksNTu30hHSt3NZdTRWaZs2TZE4kI7WRRp8fmRsRPn0PIWtJtTU
         9s+agH5I82/5KzkngCAGS6afOLlQ9sH3LpMY+P7FveknCFWUmCNOFocev9XEmoKQJQs2
         qcsw==
X-Gm-Message-State: AOAM5328pfIVKuamEewRrM1U2RZoc1dfZD7QKiQ94VO5cIKVsDzOcaz6
        9rsW/AoOvCQaHC4N0AVcePaceHZiNqqghq0t4MY=
X-Google-Smtp-Source: ABdhPJxPyS6kdjPud5OaFu3PW0Uo+y4VdJsXNi1XID1XDH6tzg4XLJgbelzfxwFfGXLY9WfLOI1cTvfQelmOFjI1LMs=
X-Received: by 2002:a25:844a:: with SMTP id r10mr728925ybm.26.1616432370141;
 Mon, 22 Mar 2021 09:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210322144848.1065067-1-geert@linux-m68k.org> <20210322144848.1065067-5-geert@linux-m68k.org>
In-Reply-To: <20210322144848.1065067-5-geert@linux-m68k.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 22 Mar 2021 17:59:19 +0100
Message-ID: <CANiq72ng1J210QwAGO_qFQrJ_1REizLGkejieuxbpOJ0Bmm_Cg@mail.gmail.com>
Subject: Re: [PATCH 04/17] auxdisplay: img-ascii-lcd: Add helper variable dev
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 22, 2021 at 3:48 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> +       struct device *dev = &pdev->dev;

Do we want helpers like this to be `*const` (assuming they can)? (same
for patch 12).

Cheers,
Miguel
