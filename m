Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17810613AC8
	for <lists+linux-mips@lfdr.de>; Mon, 31 Oct 2022 16:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbiJaP4G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Oct 2022 11:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbiJaP4D (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Oct 2022 11:56:03 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A8E120B1
        for <linux-mips@vger.kernel.org>; Mon, 31 Oct 2022 08:56:01 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id i21so18073234edj.10
        for <linux-mips@vger.kernel.org>; Mon, 31 Oct 2022 08:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54IXG2FPqhGXRhjbMJeBZJCoE2PKYVWz3wVMDeZTLCU=;
        b=Zskj8hY47y9/vRBVhsXI/zOvfwa2iyJBv9QUq1+i13j5qsNOJnVU3wL/JUdlYLqz4v
         Mk75ESkgustxHq75/QaQ5OEO1eZt7heVL+VSe9tWHj5UP5z0WxpoZwggf/S4CeijV4z5
         HpPLq4by6bha61t+359KMwWeXzdOid4NQVZsaks1CdeCumgLsRV5VNAtoBtOUtua3AOs
         B5a4nrT+akXiUSdAx3LfyeaIm/nUCwSaWn4ght0Rx/QkIRjjlRNszAEfCaGP1d1g0WE4
         nBI6wREzdJQ6Rx+IOYKCW7XmWBLDVtspMgcS3+GdeG5+YYpDHOEQlReggADgkn+UXgD5
         SxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54IXG2FPqhGXRhjbMJeBZJCoE2PKYVWz3wVMDeZTLCU=;
        b=oFBP3ZrgP+SUwCpBnOU1DPGFU+Brge3vEBp0sjUa6rxkii1W9C4pTEo9EGYUH63G3Z
         W6XjKkcXsmt89Kzy0LpWLT1TuvUnyf9hsYpFRJ98Kb+tXrv5dYnhqS/XbrQ8g/TAbNwq
         +Gp6GFft83IyGBEd5zlNmvbMudzeCaTymILeUjXQj3AfgXE1E6HZyJolFyPSmG/JiuZ3
         82xYDRMrMWbwt53Qh7wwP6OAMeu71/Lpt4di0ATLJ+KeXn3wYZv6hAaZu05Nrij2rj0t
         fpAX8rtxEdTDEoRjY1HS6VOZ0tg0rXM/X3DiT4Rhz3AH/hnPIDDhlj+9U1+pngfVDQ85
         uLdQ==
X-Gm-Message-State: ACrzQf0vXAAaqpvo3GNW9xc7G/45Jn54RScCyGpQy9xzx79Bqzx9j2bi
        Up5Az2Zm7w1mptdxfoojRF857PnzCmeSkWLosK8=
X-Google-Smtp-Source: AMsMyM4G/j8m1/zSeccQf2AkVugX8309cUfDI+UYDvZQuRuoGB23q/LHl7RH2mbAs7rIvYUS8mc5Ee0Zt9e7fN034Ws=
X-Received: by 2002:a05:6402:f0e:b0:461:aaa3:a11c with SMTP id
 i14-20020a0564020f0e00b00461aaa3a11cmr14510961eda.53.1667231759743; Mon, 31
 Oct 2022 08:55:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7208:608b:b0:5d:5fd:eaac with HTTP; Mon, 31 Oct 2022
 08:55:59 -0700 (PDT)
Reply-To: victorinaquezon01@yahoo.com
From:   Victorina <victorinaquezon@gmail.com>
Date:   Mon, 31 Oct 2022 15:55:59 +0000
Message-ID: <CAAOoKdtKiOsY9NHKOKnMFde+5RJ9erb66BYraxj99G3YEi+ybg@mail.gmail.com>
Subject: Bonjour
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

-- 
I am Madam Victorina Quezon a citizen of philippine,A widow
I am  woman going through so much pain and suffer and might not walk
again if nothing is been done fast
Please  I want you to help me retrieve the only Thing I have now in a
box  which contains my jewelries and 585,000 thounsand dollars   which
 my late husband left for me which is currently in a Security company,
I have no strength to do this due to my health condition and safety
Please Keep this Confidential
I await your response
Please reply me at     victorinaquezon01@yahoo.com
So i can explain more
With love
Victorina Quezon
