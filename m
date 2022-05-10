Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFE75521462
	for <lists+linux-mips@lfdr.de>; Tue, 10 May 2022 13:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241328AbiEJMAu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 May 2022 08:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241325AbiEJMAt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 May 2022 08:00:49 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3787E50B13
        for <linux-mips@vger.kernel.org>; Tue, 10 May 2022 04:56:52 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id k27so19695652edk.4
        for <linux-mips@vger.kernel.org>; Tue, 10 May 2022 04:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=9ygkrQc+ek2XiZL48rDG/nZ8HONRH2u6mkORGAxrJ18=;
        b=Y9Nl99f5HgrkjgDxCSpM6dbyxPS2u9FQxHujLBEikHc+qYJSzfVW7gc9Nxo3dNr68j
         Bd54r53pDXjXJu4m4yn4HKTCidCffVaVDKUNcDx92+TFM+W5iHDvCe4PSnG9OZZlgmGR
         hjF2HLehCYMNb9qh0Cj6phg9FUfv/nW13+f9RPZxKnB3fB/Vs1+3QzyOEG26NtjI+VFT
         mQsmvWiiFNXZtzaMXgZszBpXgtFges5xNKYAsS8jMCy99uaiPLAoc3TbzHnUOsbolkAr
         voWODBEyuAbrfNdpp77w2kh6DlAqB7SCn6r2s/0H+jGARegJQgF3vM/YPZaYX9wMUv+V
         9xDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=9ygkrQc+ek2XiZL48rDG/nZ8HONRH2u6mkORGAxrJ18=;
        b=MTq48JvwlESwlewBdUVI8tRb7biq2c6wrTwcGQKa2Ao8UoOmmdcZHb8ap8wuy2dbZG
         JwotQo0w7wVNBgGg/WPolsbMoIM6OAlErNJSs3UYnPqyvt0Mg8kY64osYKo70ZHiwNYS
         KAsYgStaU0jzZfy5P1WeW88OlZhlo3Os1hIyY8l1AIUzskfYXbr1t3ufRd2gCrL7DudX
         fcDZ3QimsnZa56EN3DD7O30LivSG4FLVkCE/T1K5V9ODFW4dL95mP+SJI7E/ughpwJgv
         wz4kjpBuZdMVJAblPi0Bod2e3e85I9JBO1Z7aEOFSrrj5NGwcOghjTJPx4EvUhYyTXfz
         Ezjg==
X-Gm-Message-State: AOAM530qARs7yJSjNb6atsgyHVKosn7tWpYkm2SdNC91p3j6/eW1gAtc
        ylPWMQz8vnQr2EqqrFUp8esE60/UgEjTtorpSIg=
X-Google-Smtp-Source: ABdhPJxyEaXEG+HUM8DpT/lTNID3yZQqiqgAYlDBIY6OAwMKdvbRyPxU+qwFiJgCTRvfG3CxWYW4HRPaKXVXjS+IsFY=
X-Received: by 2002:a05:6402:3513:b0:427:dd44:90a5 with SMTP id
 b19-20020a056402351300b00427dd4490a5mr23062484edd.144.1652183810890; Tue, 10
 May 2022 04:56:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:30c1:0:0:0:0:0 with HTTP; Tue, 10 May 2022 04:56:50
 -0700 (PDT)
Reply-To: sgtkayla2001@gmail.com
From:   Kayla Manthey <eyanacthan.com@gmail.com>
Date:   Tue, 10 May 2022 11:56:50 +0000
Message-ID: <CAG3fTckEzwV-fmyoKuvpSL=-XXUcmoNo_cmg1-9XcVDopvtZ2w@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

-- 
Salut draga mea, te rog, vreau sa stiu daca ai primit mesajul meu
anterior, multumesc.
