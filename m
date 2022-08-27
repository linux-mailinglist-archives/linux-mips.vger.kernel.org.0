Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE125A35A1
	for <lists+linux-mips@lfdr.de>; Sat, 27 Aug 2022 09:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234097AbiH0HhG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Aug 2022 03:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233059AbiH0HhF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Aug 2022 03:37:05 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 774E1BE4F9
        for <linux-mips@vger.kernel.org>; Sat, 27 Aug 2022 00:37:01 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso2483644otb.6
        for <linux-mips@vger.kernel.org>; Sat, 27 Aug 2022 00:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=41kW5fOWjdzzcQ6HaiOHsjJFnjWCo4jg2HDR0g9ZrRI=;
        b=NodxbnTqzR6PDRaAWMbYsuzCUJ9CJq93WTRYEH2TLUImvdy8C4v2uZjs8j/kna2/lE
         vQeCw7pcaR73tVRj6PCsqNPpCFAJzjdTCpN02okLtudUrwWsJ0zLW06mp9mUcnRzgY5Z
         lhvLz6snHdTqtykYtyEvtDvBgDzv+ZPjz+6AKgVB9V2czq+dqkjvCmmZ0VQ0QE08NpZT
         Ys0ACM4KpcNZuN77YzSIQ5+5xVfS4BIwmJqvHvIIZByCEk+xBkBuwulMesVW9RhzxA4k
         tW959XdH32XQRN1UCgEhyOMJvG2kIV5SHWTYpPVexY61fOz+Zj80yyvv9RzlC1Zed4Yr
         UeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=41kW5fOWjdzzcQ6HaiOHsjJFnjWCo4jg2HDR0g9ZrRI=;
        b=U5HHaNjOff9B4LhiBEn/XXaSWfjG1ctI1UWpdoYaUKX+R+ip3VZ5CYDNnDNtqQlxhb
         lWxMGrXGOgZe32Ba2Kkh3Wn1rodavpvtqykaRms235Xz1ObrhRGg+Ld+EJwiWhbDcuip
         VnOPecpnc8P4Vx9MANTrS26k4G+5p89LTDdJbhpUz41psAy3mgiRI2X+GkLa2GBwA6/D
         MBabBxBDZUltbtvaGqmlZxg8IYazsRMJ73idiiuqgDjpyVh+rbgcL8QIW/pS/9aqZ+Nn
         wVcpioLAQBBWdrWf37OmI0qgD7gxPlwbNtUkx/DP96aqOQef5dx1LTRz8cHUgjzHFsk4
         KzHw==
X-Gm-Message-State: ACgBeo0L0H8FlvqtOh66PCojP8l6f0XL761BKsJDXEskXAlpXTUnX2RQ
        g1hGhs6X6V8fdvKS9mjVqEoKxVJTEHIcW9rWxrrfSsn+U0tQSw==
X-Google-Smtp-Source: AA6agR4jYlukPk+MQooY9HVbgQl4iWSJtd6U5AZFWscWH+yj+LKImzYWJlyXDVsFOeHtNm8a5C5uwJtu9/TQh0RwWR4=
X-Received: by 2002:a05:6830:9a:b0:639:546d:a486 with SMTP id
 a26-20020a056830009a00b00639546da486mr2804628oto.120.1661585415590; Sat, 27
 Aug 2022 00:30:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6850:604c:b0:32a:7951:35f0 with HTTP; Sat, 27 Aug 2022
 00:30:14 -0700 (PDT)
Reply-To: abdwabbom447@gmail.com
From:   Maddah Hussain <klimowiczd0@gmail.com>
Date:   Sat, 27 Aug 2022 00:30:14 -0700
Message-ID: <CA+ARbHQwEt6j2wjTsovTEjnEoJ=K+XPc5DmD98QyAjjxYsKqEg@mail.gmail.com>
Subject: Get Back to me(URGENT)
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SCC_BODY_URI_ONLY,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:335 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4998]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [abdwabbom447[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [klimowiczd0[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [klimowiczd0[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  1.5 SCC_BODY_URI_ONLY No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

-- 
Dear,
I had sent you a mail but i don't think you received it that's why am
writing you again.It is important you get back to me as soon as you
can.
Maddah Hussain
