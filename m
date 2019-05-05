Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E970141FF
	for <lists+linux-mips@lfdr.de>; Sun,  5 May 2019 20:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbfEES5g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 May 2019 14:57:36 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40633 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbfEES5g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 May 2019 14:57:36 -0400
Received: by mail-wr1-f68.google.com with SMTP id h4so14447073wre.7;
        Sun, 05 May 2019 11:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OeDdNxFAIiJbxVlmLt0vT4oKCgbVWapVCMPZgMC3vD4=;
        b=KxTe1+XP3GjPYPEk6StBNAcJxouldhN0Yrgfja2+nGcERhV8XPv7BVqaRekYiGmmh+
         Pzvoi8pGKVGsGZPWG0HN0K2Uj4WgUgtVEctH8P24mkHpH1CznI1y3WIXNP5WrKhBa86K
         VU4h1pq/MaOD8hXFcC69gw2kl+gDUfuCOP697RM0vXS4VzUJ0JZnauEGRPKfJA73kOmo
         wMFBB+OXzUE73cMma1UUV6BgjPzWIV57jHTG2p07h1yy/LrhJ8GD/kZzlpOMtvDUr6HM
         ZT+EEJNIlbPyvGdslwHR3P95ao6HXUsRTyRBt6VVhuYeyETz1+o2n+OmiYG1rQiVrJLk
         rP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OeDdNxFAIiJbxVlmLt0vT4oKCgbVWapVCMPZgMC3vD4=;
        b=YHKrxJVe1qnJhsbczOQBnU+VPIZG7eVHNSj05VOWE34axdefJFZsADTnR+TDWBgrxd
         SHIR00pLLfbF1TRQkqIJO8TG7G+SIOmg5ORtgxW0wWOidotLY3tyn10xNnK2baTpsIGB
         SgWQsN/r399dBKFHYkLfT0+LOXO0kOfrVVc71aTM8CdRCjayau7csze/Rxr8iHx3Xeh3
         KIOqYpq3EHsCo7WsfYrpmqcXWSY99RA+DtZ9JAJEAcmme8LYgztE3KwnzkukKSjZOhY3
         LEjzoVTpELn6l5iVHFrwFoAEHiDq/O3eUtNNfM/8MNAVpGVAMHo7tqFCAcZmOR/q5q3I
         4gYQ==
X-Gm-Message-State: APjAAAU7ouVE04BUn79kdFF++TC0kKXwwJoob2baaYySg9+GcP5eV3w6
        ERvzebtXYju62g1YoHzpiVyJ13TlyfE0MzgopeM=
X-Google-Smtp-Source: APXvYqyYBQaeBgcJSB6WRG1AGb7zk5Y2dJQnwHDoqbJIkUUl4Is/8/gLZfzCfj3f4JGHIgiYsZSb5mAFT8qzAPaa2uQ=
X-Received: by 2002:adf:edc8:: with SMTP id v8mr15712096wro.206.1557082654087;
 Sun, 05 May 2019 11:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
 <20190502122657.15577-2-jonas.gorski@gmail.com> <11dc70cb-114b-fb40-1b5e-fd71b8ced1af@amsat.org>
In-Reply-To: <11dc70cb-114b-fb40-1b5e-fd71b8ced1af@amsat.org>
From:   Jonas Gorski <jonas.gorski@gmail.com>
Date:   Sun, 5 May 2019 20:57:57 +0200
Message-ID: <CAOiHx==tzUHU1nSf9c2+EtR0wJ=HDstRhHBCBQE5j79_uwJOLQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] devicetree: document the BCM63XX gated clock bindings
To:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Philippe,

On Fri, 3 May 2019 at 16:36, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi Jonas,
>
> On 5/2/19 2:26 PM, Jonas Gorski wrote:
> > Add binding documentation for the gated clock controller found on MIPS
> > based BCM63XX SoCs.
>
> I'd have ordered this patch after the #2 of this series, or eventually
> squashed both together. It is weird to document an unexistant feature
> then implement it, while the opposite looks more natural.
> (If you agree, maybe Paul can invert those when applying this series).
>
> Anyway:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

You are documenting hardware, not a driver/feature. :-)

The binding is supposed to be a separate patch [1]. The natural order
is to first describe the hardware (with the binding documentation),
then add the actual driver making use of the binding. Checkpatch.pl
will also warn if you use a compatible that isn't documented, which
happens (shortly) if you first add the driver.


Regards
Jonas

[1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree=
/bindings/submitting-patches.txt#L8
