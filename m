Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C86C257F686
	for <lists+linux-mips@lfdr.de>; Sun, 24 Jul 2022 20:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiGXSjf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Jul 2022 14:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232938AbiGXSje (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 24 Jul 2022 14:39:34 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB3911A07
        for <linux-mips@vger.kernel.org>; Sun, 24 Jul 2022 11:39:33 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-31e45527da5so90625327b3.5
        for <linux-mips@vger.kernel.org>; Sun, 24 Jul 2022 11:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=/ZZubjeZJdvwyTFrwV1vV8nw+49fRS6jv6CkuDvVhdg=;
        b=NaMthVELsJcQa8k4vw9KIphKrGRX8RMwDc22XyiRDbp2kWCxgUxejrZOoSAuhxL+K8
         klsK97lJG2zkGJOMZZ9UsH2FHF53dKSsbGOUknTKb/Fl5JaV58GGjNe61jBJQGRhaNsi
         sa38vlg9lCJlRyMu3f1CNy/lI9MLTRkgNTVePheXjvuv+Y4XsSGJqP5j3MgP247nBZfL
         3qPfFx4nUsyN0WoJvx98Vtl5xj4peUz9x/z0z2T5KOjZ8k1r1FYLa6r71B2ZXsgI5aAs
         YWqDCOckDNTcUlhYJqHnXzwRkEEVihwqhvAL8eXBT7dtkRIBEKzoa94Fl4zIL/f8u54m
         SH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=/ZZubjeZJdvwyTFrwV1vV8nw+49fRS6jv6CkuDvVhdg=;
        b=qmYAOyTHiSuFGOHrIEgfTYNYWqSHQe9QvaM/32s70H7svzYbPN8hWK6uzaIM3+NIae
         bB2iIo/CNxtiWv9ORnuufj1YTgUs/gRT7bB02Yd3/QHI+orldv4JAfZAK0SmJkEHyhd7
         J6ZTZvpECVn9XumyUir0mDiawzCJutYGPq7VotsO0RF6oWH2eLP03SlWVrbaaJ31HIjX
         aP6CPHg5cd6Xt5FX2iBiAM7tLw6fqbarlv/zpi1cWJd+SWUt01hwy5m9L2J5nkf9q0Fe
         h2A+sqjNqaEXJLgS1vTABFLAtRRP4mmVJvbR0flyf4sOWkMooQmQAytlSSgx2k73LN6u
         gaIQ==
X-Gm-Message-State: AJIora9+7sAX0F8KHZKr+rxYC8WAtz1zmhTHM1tXD0uTrRxuoLwBRYkR
        +f9Mdqjd6LxlWianjEkCrdIQvwXXYsp/QomE91Q=
X-Google-Smtp-Source: AGRyM1uwaXNpr7HYGYB2Jyofx9juUbuK5fs4VWhY75LoPAqVtPgOq0JXfrjCtdKrZhph+spfWyxrej1Zvwd8jqf5jtQ=
X-Received: by 2002:a81:4e0f:0:b0:31d:ec19:41f0 with SMTP id
 c15-20020a814e0f000000b0031dec1941f0mr6999290ywb.343.1658687972983; Sun, 24
 Jul 2022 11:39:32 -0700 (PDT)
MIME-Version: 1.0
Sender: clariallyn@gmail.com
Received: by 2002:a05:7000:4d45:0:0:0:0 with HTTP; Sun, 24 Jul 2022 11:39:32
 -0700 (PDT)
From:   "Capt. Sherri" <sherrigallagher409@gmail.com>
Date:   Sun, 24 Jul 2022 18:39:32 +0000
X-Google-Sender-Auth: 315U8wHil39wR_DCe6brjyU9QXQ
Message-ID: <CAAuO=3PTSn8nqXgLF6XP6AzJm-vpGpywHg-Vx_NS2gt8YBGRVQ@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFN2ZWlrcywgZMSBcmdhaXMsIGvEgSB0ZXYgaWV0?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

You received my previous message? I contacted you before but the
message failed back, so i decided to write again. Please confirm if
you receive this so that i can proceed,

waiting  for your response.

Regards,
Capt. Sherri
