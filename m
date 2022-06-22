Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBF62554E64
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jun 2022 17:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358913AbiFVPEJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jun 2022 11:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358884AbiFVPEA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jun 2022 11:04:00 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED1D3EA87
        for <linux-mips@vger.kernel.org>; Wed, 22 Jun 2022 08:03:52 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-101e1a33fe3so12589415fac.11
        for <linux-mips@vger.kernel.org>; Wed, 22 Jun 2022 08:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=lmXhPRDXrnlbYClAFJkfHZYdowqXsf1nTuDLZnU/Y1W/T6TJ8ApbIv950i47frAtN/
         OtndHJQoWJG+weygm2GuosJduERMEzUHLtTF4oGKopzqXa+c5O1ob2p5JuwuGNaCZz0D
         0k2iO6ZG6gpeVsjTt5A+NLMvCH8qDkpG8Ex3xIMBpunG6BNJWrlCGLJYo7boJK6pvBIx
         W4x550ST0gVpK9sdxwL58OfMVVl7H7xG/39bSvJCxipLUGbdwSBY6WRzvY6hd28wfB/N
         vDKUfqITg8PxsgA4g6gEDGmS0K0dBg3KSntFmGDvcmLKkvSy/F4e+TYysqkO/txSQBCJ
         afFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=NACNvYGoY7rOrQVxNHPY9nDjiUdhImCvvTrF/fs3nNFZoiyxo4OIgAW8FKoOEAQyEy
         TasmXo7agBCGJM4t3ACKEYZJhj1xoTIOyepVrN9JAsEtjxGDMRgbq+vCuQyRaJ1nsNu8
         zN4DjoPSz7KqAuv9H6H7nrH+eb8ZQPIZ+QMUi9VKkgZrF/KBejfCcnC7zQAqG3XMa3Da
         MLhCY6evbRQTeg60GVEXQ3st6zE4qpQ1/oCI+6td3auiFnwdjigmUByDlUModtAE1+qw
         sQB72B+bNwkOgr+4OhErzUhQ+/9j3Pz0gYrXfyUAUtrtz5oQc7cx/zumGQOKZdXN/LIi
         undQ==
X-Gm-Message-State: AJIora+EJA168+iHoRKaurEnCdulVhYrQs9RKoZd6u7WBw1BF4NRjtGs
        9bg0wsTJZ+PYBy6UJD34yFWsnwesBPSRphz04cKAKN0MFXoWYog0
X-Google-Smtp-Source: AGRyM1ulxotWsDV/SS5wzW6q4zt5LXu3F658bS4StYWI/FgPuIBqBz38zqk7aydOTm9FXxU+wDfnf428k+eRTEG/aD8=
X-Received: by 2002:a17:90b:1988:b0:1ec:f52d:90d4 with SMTP id
 mv8-20020a17090b198800b001ecf52d90d4mr1796737pjb.70.1655910220864; Wed, 22
 Jun 2022 08:03:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:903:2308:b0:16a:1b3f:f74b with HTTP; Wed, 22 Jun 2022
 08:03:40 -0700 (PDT)
Reply-To: sales0212@asonmedsystemsinc.com
From:   Prasad Ronni <lerwickfinance7@gmail.com>
Date:   Wed, 22 Jun 2022 16:03:40 +0100
Message-ID: <CAFkto5vTxj70kORZJZdwOGowXjsZ399eo6DJj=8T==7paSuHTw@mail.gmail.com>
Subject: Service Needed.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

-- 
Hi,

Are you currently open to work as our executive company representative
on contractual basis working remotely? If yes, we will be happy to
share more details. Looking forward to your response.

Regards,
