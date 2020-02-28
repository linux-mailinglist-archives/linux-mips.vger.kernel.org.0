Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5151741CA
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 23:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgB1WF5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 17:05:57 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35741 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbgB1WF5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 17:05:57 -0500
Received: by mail-lf1-f66.google.com with SMTP id z9so3239917lfa.2
        for <linux-mips@vger.kernel.org>; Fri, 28 Feb 2020 14:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C8LpeFRkJkAVGCGFA7ZkDQ8EDfylVrvQYhKNrzB5Agw=;
        b=ojCXi//c/Oh73F5Il6IazTwlBEsFoNfw47/YGyUECYl4dvUC6WgxSI3iyIlBLbz3mZ
         OSWB0BXF+JhGvD/zk+/GTAVNuJymMfHWiE5Sv3OzrtLzD8wvItVwx6Rc09jJQNdTPYzX
         r+nTnXjxGnxb2Xi53R4UsUcTjKMg0E5gsaEkeqNNdoLNPTlR4pZw9KtGmo/qhkaQZY0q
         Ebc8ul2qrGS9XuhqUFeb5gUHcchMPES2yWxB5pCRDT3o5006DzOBQ6kNkjHlHYrGFg3y
         /wC1+1VRU56iKegko8xSykYkKhnvdO+/IIHG94etItcj9WvTOxgl9cgYOkx6IiaBsY6G
         TagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C8LpeFRkJkAVGCGFA7ZkDQ8EDfylVrvQYhKNrzB5Agw=;
        b=hk/+fl/ymX6cgEjsZAsDC21E13cT4sT4bsaepzFNY+7cyoC02lUBonEepDepXIs4AY
         tfSI1k+w6e0ZtszVwWlGMeO8bjHmOwawe7SRy0Lc/6elVaLYTvZZ7R0ctmyVtXqZZcjz
         x1AA4ylsBpeuMpLrlnxNHekDe1ObDVDABBCoPY9l4T4vlPRBWkk3c3zY6HEs35p3ycVJ
         QRjy8TiWerRDEWaPet3oZ/lX7pPqluprDDV/oP1jTU84HstHcEeM938Gb4FbsHvw7jhy
         7Asu382h77kdYf2W8S25MyMGrI7SMoYyarvl96weBtSRasyhrPwJNalgKYmK8SzXe7Ax
         CB5g==
X-Gm-Message-State: ANhLgQ2mQAU194mCm4vHkPoqmCdKBmadWue/mRod+oZe4MGv19XztvrX
        zjDWmvq/Pku0BKrX4VtX9FKaZxHsTv4zUtMQ8rnqaA==
X-Google-Smtp-Source: ADFU+vsnW+F7X3gpdEz8AQTDqD1Tj7f66W9FTRZOnyRHh9OXBDCJ69RY3C5fHJ4DyNMTzylusEt2hk5oPHgCphc0DMY=
X-Received: by 2002:a19:87:: with SMTP id 129mr3655815lfa.217.1582927553833;
 Fri, 28 Feb 2020 14:05:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582913973.git.hns@goldelico.com> <010d6ad3473fb4b1f1041888a071796180cdd838.1582913973.git.hns@goldelico.com>
In-Reply-To: <010d6ad3473fb4b1f1041888a071796180cdd838.1582913973.git.hns@goldelico.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Feb 2020 23:05:42 +0100
Message-ID: <CACRpkdYSde=6JBBbe3sL3hDHhGAeOfwadT0BvL0n+-F0O2vX0g@mail.gmail.com>
Subject: Re: [RFC v2 5/8] pinctrl: ingenic: add hdmi-ddc pin control group
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Feb 28, 2020 at 7:19 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:

> From: Paul Boddie <paul@boddie.org.uk>
>
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

This looks good, can I just apply this to the pinctrl tree?

Yours,
Linus Walleij
