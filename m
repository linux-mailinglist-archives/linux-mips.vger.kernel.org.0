Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA394507C80
	for <lists+linux-mips@lfdr.de>; Wed, 20 Apr 2022 00:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357897AbiDSWbK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Apr 2022 18:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344480AbiDSWbJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Apr 2022 18:31:09 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEA782018B
        for <linux-mips@vger.kernel.org>; Tue, 19 Apr 2022 15:28:24 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2ec0bb4b715so152957b3.5
        for <linux-mips@vger.kernel.org>; Tue, 19 Apr 2022 15:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TQ16/wzEbkIxABqBQAKbTQVkqdTIndZcraJCAptXuhY=;
        b=yoXcKfD13iMzlWLmDdTn9x/FgNOG3kw5R6VfR68MomindQ8Hiv7SzULtDp5wMZtZo0
         2p564dccFw0ASuHog1Dbu75M0gub3K7/gFgedB9FsgbL9prB0ku7TgwW/yaEXe53Kd46
         PtMjQJ2lSRlOTIcQbtX63lAdpfJkOYVFqVebXApp53lXa6bmaTKCtcP1SbWNj0x+HZNF
         ihXfq9Ybd3JNnMgsO2kIJ7Iu7ExpXoHDCtksI2FYzGF7gJbGLVKmVpKKBlWdRdml5pHC
         EB6wilJJ0dh6CMGp7Nal0CpwJOfWyC2uL6utOO89/6NncgsHY0H0dT0WXcGTJcmxGqTM
         zV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TQ16/wzEbkIxABqBQAKbTQVkqdTIndZcraJCAptXuhY=;
        b=HeEznC01dpLYFnVnm3oJa5IritMts2SVekJWg+WwI48IwT0RFGPT7MoVAPqBlUWCKU
         TB/oZXo1LW4BbrXoGEeMhPlgUEX/iZS1RUFA5yglNbaNftnW9rltB6eGdmF49fKTlbZg
         kWdlCW7qxB8fi5uXNVrGuo+MkA+/iwv2G49PcDd9dadYAK92QSxeNP7MwjWL9M9yMQLw
         uu2+5Y6dNdRkCvttsjBwKfDUqlOCUtAOj6ko6F42s2PnoW1bA1T8aBbWnPDFDXvzzvNp
         cqi+IoVoD2KRSN661ABkPVdCwWkfZggEgGYvvgGr9/5Kur+HtwMH8tjfwBYgwQ4UuKOe
         XiIA==
X-Gm-Message-State: AOAM532T4aLBkh5rP8/OczvYzdw5v4AbdIcVZVDWAwQgkcnhNbBwNtTY
        Ux2KrG75JGvOpNtvS47XeB7/S14DFM4v1n8bfPSXCA==
X-Google-Smtp-Source: ABdhPJyWVz7jt1E4X9cx0GUTeF4NIpd361BkoD/MNZwADLszDMApenfwwPgUiKRHjpfFGwkluq+EgZVFHDc3jDKRGZg=
X-Received: by 2002:a81:1d48:0:b0:2f1:8ebf:25f3 with SMTP id
 d69-20020a811d48000000b002f18ebf25f3mr12081778ywd.118.1650407304055; Tue, 19
 Apr 2022 15:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220319204628.1759635-1-michael@walle.cc>
In-Reply-To: <20220319204628.1759635-1-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Apr 2022 00:28:12 +0200
Message-ID: <CACRpkdYDsHiZm+pg6Coe-u8wpkiJbX0Cfrw4ymG0KyhJp4KBvA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] pinctrl: ocelot: convert to YAML format
To:     Michael Walle <michael@walle.cc>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Paul Burton <paulburton@kernel.org>,
        Quentin Schulz <quentin.schulz@bootlin.com>,
        Antoine Tenart <atenart@kernel.org>,
        Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        "David S . Miller" <davem@davemloft.net>,
        UNGLinuxDriver@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 19, 2022 at 9:46 PM Michael Walle <michael@walle.cc> wrote:

>   dt-bindings: pinctrl: convert ocelot-pinctrl to YAML format

This patch applied to the pinctrl tree, please send the rest
through the SoC tree.

Yours,
Linus Walleij
