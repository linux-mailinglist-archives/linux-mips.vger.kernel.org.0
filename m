Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E17BC600D4E
	for <lists+linux-mips@lfdr.de>; Mon, 17 Oct 2022 13:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbiJQLCS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Oct 2022 07:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbiJQLBq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Oct 2022 07:01:46 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035D661D82
        for <linux-mips@vger.kernel.org>; Mon, 17 Oct 2022 04:00:42 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id d26so23972596eje.10
        for <linux-mips@vger.kernel.org>; Mon, 17 Oct 2022 04:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h6TAvh2KhlPwZbZl975on9cPhNtC4Qh0FGtOTBu2EFs=;
        b=DT8N1zHgLUhSB1amgTlfFh83oizvxuJI1bIsoUxMqxVUs6HsG0Bk31WC7B8BnwOprK
         D6mdVNtCiEnV4TxaF3j3hPCQmnySY0FuitZ4lFHuqDs+/kz0yR8Y/IolCLGy5i1rKQI3
         zIQ9eQ1LxaFe9lvQWiyywxDOPpb+CK+epF6ABZTS+DkW9f5mZh20AcvFA4KMwVps5ZB8
         JXe4Y91AttcyJgHMjZFO7ABKX8twjogHMbgukFek7fDiU2DepYLjOSV/SrNgT2eaKZfc
         BmNVu2eUWCWIP4AT6DQBUh/oyB3Fiw4B2pP72PaHrf82HVgxEmWrD8TF75gUsj5psKlF
         cI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h6TAvh2KhlPwZbZl975on9cPhNtC4Qh0FGtOTBu2EFs=;
        b=xUpWUgVGBmw86B3OgMbafykK5PiXX7ZXNUZAUdzwf4MG/H/xTrZrS7f5k+SqsD/eji
         9KNnFVsq/VW7Vt0mfzyX99PXWlT00910/A2KzEEMkoFAHaFN9c/eC2MobozjHasc3oCQ
         ZeXyDyPiZUgIfCW5943y+S/1dWN+D53rK0fvcUoIq7VDcmYvcOQ1OHF2qJU+1izuk9+e
         Io8XWRASs/vmjrYFYyEG/Kqoojw05wYCEi/tiJhN1mn6Uth/VCk5BN4hbzQ9cdHk1gYn
         h5LO1ZdfAqM6i2JiUawA2WHioRkWWoJUrdMoF2Nt7C+sEKiVFBzkdQvnPbsJo4q9EyxT
         fkHw==
X-Gm-Message-State: ACrzQf3z2BcYKs8uyOpNdvoCDy8PM90NxNJvTB4Nf9lST8C4jybB/uXH
        waDJFf/4gZGAbiO9irI6ycm6S1yxy1qaSyT8ltE=
X-Google-Smtp-Source: AMsMyM74yHjVKIntIP82c1RevnU7nAjR2UNpS5Lb2GuXZmne+62tWsGsOvV77WZgR2y3iOGN4qsJp/C78bwdlkN2CtY=
X-Received: by 2002:a17:906:eecb:b0:73c:5bcb:8eb3 with SMTP id
 wu11-20020a170906eecb00b0073c5bcb8eb3mr7860270ejb.284.1666004425820; Mon, 17
 Oct 2022 04:00:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:71a:0:b0:1df:c5cd:1b43 with HTTP; Mon, 17 Oct 2022
 04:00:25 -0700 (PDT)
From:   M Cheickna Toure <metraoretk5@gmail.com>
Date:   Mon, 17 Oct 2022 12:00:25 +0100
Message-ID: <CACw7F=bKmq3FB6uTbtMRGMKD2i_mzwTSayyUxgyDT06qYbcJNw@mail.gmail.com>
Subject: Hello, Good morning
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,
Good morning and how are you?
I have an important and favourable information/proposal which might
interest you to know,
let me hear from you to detail you, it's important
Sincerely,
M.Cheickna
tourecheickna@consultant.com
