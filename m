Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C25E4D1A8F
	for <lists+linux-mips@lfdr.de>; Tue,  8 Mar 2022 15:28:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241948AbiCHO3p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Mar 2022 09:29:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243891AbiCHO3m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Mar 2022 09:29:42 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9BC2253B
        for <linux-mips@vger.kernel.org>; Tue,  8 Mar 2022 06:28:45 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id p9so28819016wra.12
        for <linux-mips@vger.kernel.org>; Tue, 08 Mar 2022 06:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=+xCzDXKpurcBEhZ8+xr/1+qLsXYFBobYcsOzCn7TcBU=;
        b=qVkxwgK1b+28wfo7AE+m0D/9E55CAaNHjVfggvzz4y1jrFEcqF+CAdv7IM+KHyJAsy
         kWCN5Ez/mP7h9h6bpxp6/TAEaV328gRxK778qVwrRxvxR4tr/l1RPCTDR82iQTPn5Wax
         TuZA87kQltJfQLsmP6fuZKQ4pIZQdhPxY8QrrnSjm8fSJ2AHt2tzEL1IA3nq4God2ic6
         tPmcjhh+nE10IgFYtUr+FVpp8W0kskWdPNSjKh3Oe6HsfmAo/TeQKi+EB4jfdFsCBF0e
         TEurA9G1+D3aT7wDN9rqiSJk5jriFub1oW7GvWnCc4W5i0HJjijUpIjbRko/xul1waJf
         G8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=+xCzDXKpurcBEhZ8+xr/1+qLsXYFBobYcsOzCn7TcBU=;
        b=FkgsIOmlsrvSESEfGS66M7eRrZKlkGrR3W8JC8AYWbIqmaj3QxpMauHje8liWbwwwV
         T5TMLhebnsh4wG+8HNXzKHFYAbXgHVf9/XJyW1HGp3/O085hx2DalBaEILC+qmB/s3BG
         8M1/jASgfzL/NTM0QUQgFqh4TV1xWZowVwOGYn6lEEsQZ+aJ4zJ8h7LdwqN7oF+snVWp
         KJKT2CrqelYOD/KfDOHUaUNEauaP58bY393myKNp136Fn86MGLlh2ASQsEUMyG4Zxjah
         kyWFQoKOXF81RFG1SROD6LBmu9lezXmUUN7Urd5dAhivKHUh6Hakc9OAtoqMzluu4R8b
         ifrQ==
X-Gm-Message-State: AOAM5301ibG1c9UwVypP5osAYwgYtT2hyuT9aD3o86WJsiSRr7CXSNc5
        l1qhy8/TbNGpKQZX3eMeWYHTvhPfy74rLVPKPOs=
X-Google-Smtp-Source: ABdhPJyN362TV5q1ThoYoFsjE56SEqE3pAvo+m8K0LdM8BraKLObiWoLsRgnZNl8B6Cr2p9ZNZLFOSA4UBHJcsFsV94=
X-Received: by 2002:adf:eb86:0:b0:1e6:8c92:af6b with SMTP id
 t6-20020adfeb86000000b001e68c92af6bmr12495967wrn.116.1646749723258; Tue, 08
 Mar 2022 06:28:43 -0800 (PST)
MIME-Version: 1.0
Sender: abiodunboluwatife2017@gmail.com
Received: by 2002:a05:600c:502c:0:0:0:0 with HTTP; Tue, 8 Mar 2022 06:28:41
 -0800 (PST)
From:   Lisa Williams <lw23675851@gmail.com>
Date:   Tue, 8 Mar 2022 14:28:41 +0000
X-Google-Sender-Auth: V9xPcfHWoWwaPZchQ2Y842fPtP0
Message-ID: <CADqw2PJ6dps8sfkNJTY6MXZohie2=6P_cMwuASuV1SNoGXNDuw@mail.gmail.com>
Subject: My name is Lisa Williams
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Dear,

My name is Lisa  Williams, I am from the United States of America, Its
my pleasure to contact you for new and special friendship, I will be
glad to see your reply for us to know each other better.

Yours
Lisa
