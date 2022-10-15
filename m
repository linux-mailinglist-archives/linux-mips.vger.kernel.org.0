Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E97375FFC99
	for <lists+linux-mips@lfdr.de>; Sun, 16 Oct 2022 01:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbiJOX0S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Oct 2022 19:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiJOX0R (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Oct 2022 19:26:17 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A2D36877
        for <linux-mips@vger.kernel.org>; Sat, 15 Oct 2022 16:26:16 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id sc25so17593816ejc.12
        for <linux-mips@vger.kernel.org>; Sat, 15 Oct 2022 16:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6aF9nFwwA4H8y+DQySeTN9I4LSFxeOQ6cH2LPftSBU4=;
        b=RbyDOQ8+95lSlsvROn0B7tCcdWH7E83RHDnpAQLdfLb/vdPYZo0YQtIitVtesSxibL
         u4cOm6u2CbXABtBAn1Ci1aVhDr1cSePDGIKudRoFuuFIeNu0XlQgozfD/CBeEQqyQB18
         rZcjB93BxfFjqEsfJKIugLonMd2rpCU+H5iHl8bdUZXn2oSqW1gYGJ70+tPeUk0QjyL0
         SWO0muiXEMOcXHqrD6IRybgMDMkhDCgazBNa1e8mRGUPyrc6qetdr9DywjUe9F99QC/o
         0Fgw8qBAtl64TjEu7SCWzz6pKA/dq++NS8V6x8NF55UlHwJMY/dhduqjel1RdnYQsYE+
         uPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aF9nFwwA4H8y+DQySeTN9I4LSFxeOQ6cH2LPftSBU4=;
        b=yPeT04zT6prM85DDvcncdBqIZ1tMFEi+DkLWMDg1Fokr1bxyDSJ/unnwCTDaMnnums
         l6q/l+S/piiQhViiLjKnJIfqUiiyGgdJi2nUBAorXbS98yyja5nFCs5rtVqVfVKoakDW
         d9WY+iy8wszYxuawY1pKzPH/+wXyb8MkddlFZpAHKb2WJVeoLhGBBw24jMC02/EGWRsk
         fLlgGKz/iX4YvFn6DajJxSiqCthnILPlDJ2bhjp+38OOCGn7w1xMfAYcL+juBBROFFi3
         mpapLUZsfbXsTbgZ547BD1La2m1vCj5BGV0MrWu8j6w4anNeFBK0Bdxx8SZd7MIwvqrG
         5mJQ==
X-Gm-Message-State: ACrzQf1gw/iOEJdOA+b3gylUvNdvS55Rdeq0NAshn7XTG7MGoyieiMsZ
        Uuhtsp6X190nPa5i4R1R4+QU8a2gsVfI1IGwJcw=
X-Google-Smtp-Source: AMsMyM6A9bXKQkweg3Cv2tYIvpirOalZQvhu75nu+oSljW2D6rVhA84ETFO+QxKFRxggEO3+ptBdNIqe+Yi6iQf+Me4=
X-Received: by 2002:a17:907:2d0f:b0:78e:9ca5:62af with SMTP id
 gs15-20020a1709072d0f00b0078e9ca562afmr3120257ejc.334.1665876374475; Sat, 15
 Oct 2022 16:26:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:4c8:0:b0:1df:3d2:9387 with HTTP; Sat, 15 Oct 2022
 16:26:13 -0700 (PDT)
Reply-To: richardwahl9035@gmail.com
From:   Richard Wahl <moserabiage@gmail.com>
Date:   Sun, 16 Oct 2022 02:26:13 +0300
Message-ID: <CACVAh=7o9D7frnwdrq6NqjKGy0fE9JZ0QVDNrc-aOkbhk_H5iA@mail.gmail.com>
Subject: Re,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.2 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,REPTO_419_FRAUD_GM_LOOSE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.8869]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [richardwahl9035[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [moserabiage[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:632 listed in]
        [list.dnswl.org]
        *  1.0 REPTO_419_FRAUD_GM_LOOSE Ends-in-digits Reply-To is similar to
        *      known advance fee fraud collector mailbox
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--=20
Sch=C3=B6nen Tag,

Ich bin Herr Richard Wahl, Sie haben eine Spende von 700.000,00 =E2=82=AC. =
Ich
habe ein gewonnen
Gl=C3=BCck in der Power-Ball-Lotterie und ich spende einen Teil davon an Te=
n
Lucky People und Ten Charity Organisation. Ihre E-Mail kam heraus
siegreich, also antworte mir dringend f=C3=BCr weitere Informationen unter:
richardwahl9035@gmail.com
Aufrichtig,
Herr Richard Wah7
