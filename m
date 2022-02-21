Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A23B4BECA2
	for <lists+linux-mips@lfdr.de>; Mon, 21 Feb 2022 22:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234884AbiBUV1q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Feb 2022 16:27:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiBUV1p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Feb 2022 16:27:45 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37AB9E26
        for <linux-mips@vger.kernel.org>; Mon, 21 Feb 2022 13:27:21 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id e5so18924279vsg.12
        for <linux-mips@vger.kernel.org>; Mon, 21 Feb 2022 13:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=6oHWX8sH3tohS1DPDLSFcUzMKYSwL6J87hX19yyB3G8=;
        b=b8sdxsACSpr4HYLgTlOxLGwo3CBZcNQlg4Ull623nTwehmgkcFqNqwFEQjqSL63gAH
         R7qxL4vQWmvyPz2NtmikmEm4nOKfmqKpoLeUQrGTOM0kxSTkZIrip16A2jSZ6ie5KwPb
         lRUy9yQlO5Q3Cui4Vm1y+msE0odbnhba2uvxJzwlmCjZF+z9HbDNtVzsyrud5DIWg/Bu
         qEwp6Ef/J37unG31k0IVovOm2RMFyNgMPeYEQQiO4cKXW1jNxKszlXg9m8qh9swSuFYA
         DiitOIuwMnRBN/jNBFfzLhSOsSoUee5yuQ7c7SRQif5kIiviiSKPCot2yeiSVGIT0yP/
         KMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=6oHWX8sH3tohS1DPDLSFcUzMKYSwL6J87hX19yyB3G8=;
        b=meRyUCvpBzNh1KxmtrBEgS5OjR56NHEWUCtA+mCccSeJIsoSefRuXv0PrATfaS9YEF
         /l9X/PBVwBwRZ5eYhWWh7hdBHBGkM8uGHJR0TjhSNTEnbs6ypR2NJkAWgjMXMNUgndxs
         YMBmANyivFpcfCW5C2OLlMiz/AJxnXxKtiIpFWpCw31N8bd1szDhh+oScmWNxYXhYWCa
         h+3qoL+a5e09FPeTUsZ0FtYbC/O81Aq6sqnOmQiIN/Dq9oVODnGEmhMt6oKjtRxRi1//
         897UfySJ7gnlHNfpSuRbpLL6lieu34ro8rq2jiyFnkhMOvXX477makZamIEqRNblCw32
         o7Rw==
X-Gm-Message-State: AOAM532Mx4tWA/tWuftxkg50oLLUgV+pSBRLbQclqEzetU+1oI6tHL5K
        3ILxGxZJmO9LbKeTOaV8eExlbvDw17bNKLQSPjs=
X-Google-Smtp-Source: ABdhPJzx8SPRGau4LZMXOBvdNqVvAPXtftrFT5Ofqh9r4QN3l5UyUzwuRx7zg9vxAQgKZkToVr6V+PwLwTaLrVbkeKw=
X-Received: by 2002:a05:6102:7ba:b0:31b:f0c6:adf9 with SMTP id
 x26-20020a05610207ba00b0031bf0c6adf9mr8185406vsg.16.1645478840387; Mon, 21
 Feb 2022 13:27:20 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9f:2592:0:0:0:0:0 with HTTP; Mon, 21 Feb 2022 13:27:20
 -0800 (PST)
From:   "Capt. Katie" <basilesotoume@gmail.com>
Date:   Mon, 21 Feb 2022 21:27:20 +0000
Message-ID: <CAL897DjJVo28dGW_+-+kgzPFGzPnR9qetd-VzNpZtpu516QgaA@mail.gmail.com>
Subject: Re: Hi Dear, how are you
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hallo,

Sie haben meine vorherige Nachricht erhalten? Ich habe Sie schon
einmal kontaktiert, aber die Nachricht ist fehlgeschlagen, also habe
ich beschlossen, noch einmal zu schreiben. Bitte best=C3=A4tigen Sie, ob
Sie dies erhalten, damit ich fortfahren kann.

warte auf deine Antwort.

Gr=C3=BC=C3=9Fe,
Kapit=C3=A4n Katie
