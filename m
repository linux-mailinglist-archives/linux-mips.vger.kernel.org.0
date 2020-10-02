Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6010280FBF
	for <lists+linux-mips@lfdr.de>; Fri,  2 Oct 2020 11:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgJBJVY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Oct 2020 05:21:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:45512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726029AbgJBJVY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Oct 2020 05:21:24 -0400
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6672D20758;
        Fri,  2 Oct 2020 09:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601630483;
        bh=x5VTDBtOMTRwW5Sw747OpvTmgVVW1CQQvrNgU0YSFNs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VeY56BONbbmm2FmoqnTtM9j0aC5oneFySPSit/aqtF5HMMwkvhw+S8PlR4PjMhBv2
         MgJXyVXNGNFs4aKNGCJocT13mZWvA5zI826AjQ6tKa1Sz1szZTnT/oTITNdsgyK177
         f9J+EMB3qFETAAOQ4tF6pn5moG9vszHhf+sw5NbM=
Received: by mail-ed1-f47.google.com with SMTP id i1so960528edv.2;
        Fri, 02 Oct 2020 02:21:23 -0700 (PDT)
X-Gm-Message-State: AOAM533OBpZ92jzDRVb9Xc9F8m9ZDPDBIllMJ/sa9+XqjmJm5/yMMgOh
        3wRW8ofpYQYlOblLdPr6RarpdR53ABZRNbUuLOM=
X-Google-Smtp-Source: ABdhPJy5R7Q+WOsSZvDV+Obr4DkMiRhMPNxAJD8JtEaTr3YODtDYA+A/6b0kb8ZGbmu38wYHJp0uYdwzdG8IbDIrIZ8=
X-Received: by 2002:aa7:da16:: with SMTP id r22mr1364149eds.132.1601630481982;
 Fri, 02 Oct 2020 02:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de> <20200930234637.7573-4-post@lespocky.de>
In-Reply-To: <20200930234637.7573-4-post@lespocky.de>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 2 Oct 2020 11:21:10 +0200
X-Gmail-Original-Message-ID: <CAJKOXPewAhZU1Enz9HrdrG5RF==y6Mna=E_vfpD4u2747CVo8A@mail.gmail.com>
Message-ID: <CAJKOXPewAhZU1Enz9HrdrG5RF==y6Mna=E_vfpD4u2747CVo8A@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] dt-bindings: mfd: Fix schema warnings for pwm-leds
To:     Alexander Dahl <post@lespocky.de>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 1 Oct 2020 at 01:51, Alexander Dahl <post@lespocky.de> wrote:
>
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).

What warning? Please post them here and in every DTS patch.

Your schema does not enforce pwmleds node naming (the main node, not
children), or at least I could not see it. You change multiple files
in your patchset so are you sure that all these are justified by
warnings pointed out by schema?

Best regards,
Krzysztof
