Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00AD54BB9B7
	for <lists+linux-mips@lfdr.de>; Fri, 18 Feb 2022 13:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235683AbiBRM5d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Feb 2022 07:57:33 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235624AbiBRM5L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 18 Feb 2022 07:57:11 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5352F27FE4
        for <linux-mips@vger.kernel.org>; Fri, 18 Feb 2022 04:56:38 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id f17so15375566edd.2
        for <linux-mips@vger.kernel.org>; Fri, 18 Feb 2022 04:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=JQAvlLJWgldHDOHcIcacjIOpg5TUZmVngZ2Pms5NG7Q=;
        b=OZEbl6KFipfUGSY3KFbkW5bY3S675hY6/6OQBZOkiQDH6GySEY4TVOEFN7FJqiqPJO
         agFru8efuG36LReL5w2nHtLPmYtalsoT1wnvZtm5B66UR3WpHZe7YTWBnI+8hwcg+B9b
         6VTqOjeC2sjnoEVsct21NLGE+w42y7sE+dK+Kvyf2ZNQWqLNSVCxvg8SrSQ4nfcquitG
         gNzOCZpbJ3cIiSkDeprGVHuEDLqS0lNFTsmcAJrL1QvP69xRb+k98zeCzu96aeF/5vna
         AQQtm0c00Xr1SD+EXnd+BcRUJLCn+nrZnVcDaQjb8hG/lck3U1O70LYNSK/UVt5iDZ4s
         w/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=JQAvlLJWgldHDOHcIcacjIOpg5TUZmVngZ2Pms5NG7Q=;
        b=LbVfzQxrlpIzEc+xMDpOni5h5xFzyambLuvdeD07+j38dNpv5Br3wK7eAUeWQCoJui
         N0KfFi1bZKWAx/d88le3odAu4KDOy38Btkx+TPozTOsRlUH1kCVpKn2/4b+vqgt7lxXN
         DtQLjylHZ1cw8or1VVtms4yxpQU0Q9ON6lXGOJCw3ShmzQI/2HsLSqLzZnqJcw1UNl50
         RaScS9dAwiLjtkjEHz4YGmjOFC8DjwZrXg/Yg7dow/W8eohIUfSiW9p7ulwIYDEIy1Y+
         HnI9u63ChFWAK1M6ALMcIGToEeSvuBJzD7jlm4mlG5KsYoKa1aUuKSIyJES6X7PndVBE
         HOFg==
X-Gm-Message-State: AOAM531w03ZRooL4ikWwdlAkSkBD536nf6rnzvd+EBX/vDGttoxGUYF1
        U+T7Hq+ct+suE2GF/ji+4Er15pm28UTElLYJj1g=
X-Google-Smtp-Source: ABdhPJyy4wsNexIMJl8t/qFduIub1BwgK6qhMR7/odqNLNSPL6c7sGIHAwwI3wMCua1JSW86yo5J9Zuy9ZUHmEauhdw=
X-Received: by 2002:a05:6402:2801:b0:410:a592:a5d0 with SMTP id
 h1-20020a056402280100b00410a592a5d0mr8026964ede.253.1645188996769; Fri, 18
 Feb 2022 04:56:36 -0800 (PST)
MIME-Version: 1.0
Sender: brianphilippe60@gmail.com
Received: by 2002:a17:906:d04b:0:0:0:0 with HTTP; Fri, 18 Feb 2022 04:56:36
 -0800 (PST)
From:   Aisha Al-Qaddafi <aishagaddafi1894@gmail.com>
Date:   Fri, 18 Feb 2022 12:56:36 +0000
X-Google-Sender-Auth: zimhkdm4D_7Zb9el7ImS1HVoEM8
Message-ID: <CAG_+5rzYP5EJeFoJ8ag25DHdaJAYO-mwwPF+ctcuT0zqZyKjHw@mail.gmail.com>
Subject: Investment proposal,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.3 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY,URG_BIZ autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:52f listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5245]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [aishagaddafi1894[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [brianphilippe60[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.6 URG_BIZ Contains urgent matter
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  2.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Dear Friend,

With due respect to your person and much sincerity of purpose I wish
to write to you today for our mutual benefit in this investment
transaction.
I'm Mrs. Aisha Al-Gaddafi, presently residing herein Oman the
Southeastern coast of the Arabian Peninsula in Western Asia, I'm a
single Mother and a widow with three Children. I am the only
biological Daughter of the late Libyan President (Late Colonel.
Muammar Gaddafi). I have an investment funds worth Twenty Seven
Million Five Hundred Thousand United State Dollars ($27.500.000.00 )
and i need an investment Manager/Partner and because of my Asylum
Status I will authorize you the ownership of the investment funds,
However, I am interested in you for investment project assistance in
your country, may be from there,. we can build a business relationship
in the nearest future.

I am willing to negotiate an investment/business profit sharing ratio
with you based on the future investment earning profits. If you are
willing to handle this project kindly reply urgently to enable me to
provide you more information about the investment funds.

Your urgent reply will be appreciated if only you are interested in
this investment project..
Best Regards
Mrs. Aisha Al-Gaddafi.
