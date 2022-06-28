Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA2E155D47F
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jun 2022 15:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245390AbiF1Lrs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jun 2022 07:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345280AbiF1LrV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jun 2022 07:47:21 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484C430F70
        for <linux-mips@vger.kernel.org>; Tue, 28 Jun 2022 04:46:03 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id p7so20328372ybm.7
        for <linux-mips@vger.kernel.org>; Tue, 28 Jun 2022 04:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nua9RNJzDCWgVHpkEh0NUQ8tFuGKU1srt8vXN1gfZic=;
        b=Q3iU0RpT3JDULxDcaqXjRljk/CgOygq4zgLTnYVoRAX8++JnCCjTHthMRJRsDks1jq
         hDIB6ccWfXxryvY4lbt3esNxqyZya/Z3j15fH8N/UGYS6PgMKv5fCbP8ROdbQvevneAh
         /2KgA/X/3KO4C9dKiam7XRbuoTG6ocU/jO1p0KpTqWbZdxYyMS9GT7sqIrWHyL4mA3Y+
         0/IukjtN8k2PYecQv36ge2VXtPbyPB0wm+Ul5eqGM6yU4GA31V9WSXqBoispPgaYGRM1
         rZ97fkHNANrIYWVp9LNQCNxOwJ/WBtorpWdV1Uskz7FxyU8S1iEguDho7S6SB3IX+lkL
         +mlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nua9RNJzDCWgVHpkEh0NUQ8tFuGKU1srt8vXN1gfZic=;
        b=3hWZzyoSUK8ee0d35w9vVc4bEIOb0SyasfpBEbcMdgV231rbY3NtV2Mpl9W7rGt2CJ
         6Fqz38omn3btnbKtXQ0De1tu7wGfH1Z8mJG0mw0cSZL+NoFX4uZu/anEr3X45dsDHaIF
         eduAJTDhqaOQc2ujkytjRwiLbMB6ye2YJrojYc6XN6pY/Kuife92FeeX01KUfXbbgHIv
         ZwC9JAbbCAwSUe+vWNyisNqgCczMDN01hNB2z8VHgbeaLnxg+kADiRNFX+qO4qJaIXOg
         iYXB0n7s43DH3JSbC0tWLNeg67Ho1MfT/2XSZux1hkjDYv4g9Z6RXFaADzPfNmviYk6q
         7WYw==
X-Gm-Message-State: AJIora+F8CcPlpAhfa3KnHvRGHAB2AHPGCPqCiqGoZxEibXFCz1qL5re
        bbgW00OgYFjmQYZ0mCe6IWp3lkRNE9fjX0m5CE1Sd9L4Kto=
X-Google-Smtp-Source: AGRyM1txnIEflUovpqZSdzrs97LsZmYjv6cqdQQ6duzljYSGfyoALBguW/HSjhp3Q6Dip7ppRUr56SVwuq0HncjH3tQ=
X-Received: by 2002:a25:8403:0:b0:66c:a405:a01e with SMTP id
 u3-20020a258403000000b0066ca405a01emr12850746ybk.369.1656416762419; Tue, 28
 Jun 2022 04:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220622185010.2022515-1-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220622185010.2022515-1-aidanmacdonald.0x0@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 13:45:51 +0200
Message-ID: <CACRpkdb9JacaDrOo_8zyLMQQedcfztU-KSpX0ZoKBk+8VS8j6A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pinctrl: ingenic: Convert to immutable irq chip
To:     Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc:     paul@crapouillou.net, maz@kernel.org, andy.shevchenko@gmail.com,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 22, 2022 at 8:49 PM Aidan MacDonald
<aidanmacdonald.0x0@gmail.com> wrote:

> Two cleanup patches for pinctrl-ingenic.

Patches applied!

Yours,
Linus Walleij
