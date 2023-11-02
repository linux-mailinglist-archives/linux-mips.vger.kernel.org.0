Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 686647DF427
	for <lists+linux-mips@lfdr.de>; Thu,  2 Nov 2023 14:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235129AbjKBNn0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Nov 2023 09:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjKBNnZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Nov 2023 09:43:25 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18AFA6
        for <linux-mips@vger.kernel.org>; Thu,  2 Nov 2023 06:43:22 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-2802b744e52so1709994a91.0
        for <linux-mips@vger.kernel.org>; Thu, 02 Nov 2023 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698932602; x=1699537402; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F1w+j/4c/1BFWl/3h59aajp4r9v+fftTqF3noyIrajI=;
        b=MpfUcsLzaKwJR9QTMAidSTP6hb9Xdj0z1Q7MLp+Vb8O77PQeyxyj0A6cWxrCivO5Cd
         YqALMjO8szvfXSIUbLpIQGe0g3XU9d4025QGCnCaxUDVnlb17B8PYLX3nsVYZIfaUejJ
         FWRAVDZmiYif/h0aJ5DfeCWNzGLEvsd5vdsXKb9Fe9ve426w/iy1+mdzXdKNIxDrfp0b
         FJohIgZaykaAlMryT+8+jZN9ATqHbrWziIuSPcBD7TTgf3dl/wxxPQNU7cL+L2RFQ53L
         WkLuSWVk8DYci6ByTzeMrMVSqzgU9qldSFvzJxXJ3ZOS1eg7kN1IV/xrQNhZ47twfwKv
         IRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698932602; x=1699537402;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1w+j/4c/1BFWl/3h59aajp4r9v+fftTqF3noyIrajI=;
        b=PR0Paid18a1UpYtgQ4NoW7DFxWbgOjzbXHzOGrh3ja6v9/liW7SNAaarhRiFh2n4B6
         B9AdTLxzPDAJdYxFPeFkR4Xuheel+9lHQYGznEqv8f84G8ODkCa4y7z7QzDPcUO9PoEr
         +lH0LQOpVbGJm1t0PH9/kKvq+xmEh+5QbgEYnAeSeLmKkkvAzGncCpZLA3pPLiPFX2SR
         NLADZDJyfpc4q35Vy3eNt3uA2tg77Iuw4dV+tVpnaRvuKFzjhKtSoDTx60IdoZUmPvPQ
         3b0WARNPEgud345In6f93uW1R154rJznKQjVDBStZw0ACZU2qRDdObyBUc6n321mQNLh
         ENJg==
X-Gm-Message-State: AOJu0YxtU8ZFCYu505QZBOYG6RmTQzc2VQ1qEQpUpFpxvB647XIAh48E
        2JTTd9zjBznN1wPRrzTmNE0rEDNzAfX3Xk7qxQ8=
X-Google-Smtp-Source: AGHT+IGy0aWdRerRtEyiW1V62Ygg+dMuLduPTG9KwqED5OxORsHJf8dFCiGgTIPehbuALrXEA7kHtXfJXxZAfz9TFN0=
X-Received: by 2002:a17:90a:f197:b0:27f:e955:5682 with SMTP id
 bv23-20020a17090af19700b0027fe9555682mr11954321pjb.3.1698932602225; Thu, 02
 Nov 2023 06:43:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:92b:b0:6e:e303:a059 with HTTP; Thu, 2 Nov 2023
 06:43:21 -0700 (PDT)
Reply-To: oj616414@gmail.com
From:   johnson pattaego <alidjiman00229@gmail.com>
Date:   Thu, 2 Nov 2023 13:43:21 +0000
Message-ID: <CAECK7AbzY8512_8Wup_uqbkEiToJnKJV+azw=WpZzKYkg9EsqA@mail.gmail.com>
Subject: =?UTF-8?B?w5xkdsO2emzDtm0sLy8v?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

=C3=9Cdv=C3=B6zl=C3=B6m, van egy v=C3=A1llalkoz=C3=A1som, amelyre =C3=BAgy =
hivatkoztam r=C3=A1d, mint
neked   ugyanaz a vezet=C3=A9kn=C3=A9v, mint a n=C3=A9hai =C3=BCgyfelem, de=
 a r=C3=A9szletek az
al=C3=A1bbiak lesznek =C3=A9rtes=C3=ADtj=C3=BCk =C3=96nt, amikor meger=C5=
=91s=C3=ADti ennek az e-mailnek
a k=C3=A9zhezv=C3=A9tel=C3=A9t. =C3=9Cdv=C3=B6zlettel,
