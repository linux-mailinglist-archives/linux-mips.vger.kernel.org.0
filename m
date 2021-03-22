Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4071344CBE
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 18:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbhCVRFc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 13:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232056AbhCVRFV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Mar 2021 13:05:21 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C95C061574;
        Mon, 22 Mar 2021 10:05:20 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id h196so7319686ybg.1;
        Mon, 22 Mar 2021 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0TkNDlNKd0sFj/dXyqvxrf5TO/FH8XVuZf1hjeO1uBk=;
        b=O0MtZPnpOja+H261XGih1GgiSLTGlg1zvGcF49cbfMD6+a5N5RRwR7WEloY/b3Z3gb
         6nrPiV71ZA+pmcXwgjw0rppzZuxJx8kSPCw5QBE5AmzIUHDOoGBH4MZAJFue0QcTBnBm
         mWjYEK2sl/cgmVCxtV3V6aAxUtl4NAJYCeNclGfDHgag8LLqtbzDttE7r/qwzsoDFPRz
         TKLWVgebEbbYOgboBEonP6nnPhKAvc4z498KSjL5eIhnEb+6+f+DBhEcrcJigcaLu9Vc
         Ncm+9R/P1g2He5GhEh3Bsxhvq03vQuvWWPtqIkszOLUcZZjn+asckof3ETDDzBWLDI7W
         x7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0TkNDlNKd0sFj/dXyqvxrf5TO/FH8XVuZf1hjeO1uBk=;
        b=U2HZHaFCq79bYQHbUmZGfR+QbNBFoYggFAiCyfmtLHb+gknhyrnoIXBziztbosvTlK
         uEcwGMR7brJyJ+iEFGLa2CYe21H86NbTMTrD61Tsrr5b6wIKjE5taTrJZtlmKDP4ZUAL
         kl+fn0e5fFsydQonJC4B+tPbmbnU+vaLA0yvWqvnF3Vi9sv2Uivt/uNDxZFRDvSu+ZqB
         SjwDX7qaoxwDlFKV10WNlJYHs25T+sNDi/ajVR0ga4Dg1dcWK+N87kGWMWtvIpjLm7aj
         gJ1+IoOITVLVBG2JTdlpDR3HM8MRypOk8CyhC8UzNrEJagDHh2bb0LAQ7a+yk8SQ0rF3
         aXMw==
X-Gm-Message-State: AOAM533ghWzHNtthTx1ce+6MU03kVrElS3s2sZQo43LJUkjGNL+oEmnn
        eNb5lJppwEQxL1ctQ3S2IkrC/88pEfNjnWMKs0g=
X-Google-Smtp-Source: ABdhPJwDavBYqW3TIC/jAVoKZeDFXrZcq3fMeMq5h1YJHiDfMDfuB3LNmJH5CP9lwEN7n9ITjm5dQEKLFo8ArAeWtL8=
X-Received: by 2002:a25:6e02:: with SMTP id j2mr622782ybc.247.1616432719824;
 Mon, 22 Mar 2021 10:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210322144848.1065067-1-geert@linux-m68k.org> <20210322144848.1065067-2-geert@linux-m68k.org>
In-Reply-To: <20210322144848.1065067-2-geert@linux-m68k.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 22 Mar 2021 18:05:09 +0100
Message-ID: <CANiq72nL=BRz8XE_mSUvOMZg8ssJ6jO43QoVD5SyLsiqgQpDEg@mail.gmail.com>
Subject: Re: [PATCH 01/17] uapi: Add <linux/map_to_14segment.h>
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
> You can find an image of the full character set at
> https://drive.google.com/file/d/1h3EYFBWHIjh8B_cwPA5ocAD-lFYipRie/view

Should we put it in e.g. the Docs or just alongside this file?

Cheers,
Miguel
