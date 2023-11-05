Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F10A7E172E
	for <lists+linux-mips@lfdr.de>; Sun,  5 Nov 2023 23:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbjKEWAg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Nov 2023 17:00:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbjKEWAf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Nov 2023 17:00:35 -0500
X-Greylist: delayed 5231 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Nov 2023 14:00:32 PST
Received: from SMTP-HCRC-200.brggroup.vn (unknown [42.112.212.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C28D9
        for <linux-mips@vger.kernel.org>; Sun,  5 Nov 2023 14:00:32 -0800 (PST)
Received: from SMTP-HCRC-200.brggroup.vn (localhost [127.0.0.1])
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTP id A793918F7A;
        Mon,  6 Nov 2023 01:57:42 +0700 (+07)
Received: from zimbra.hcrc.vn (unknown [192.168.200.66])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTPS id A082218F79;
        Mon,  6 Nov 2023 01:57:42 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 35B5B1B82534;
        Mon,  6 Nov 2023 01:57:44 +0700 (+07)
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id IRrh10Q27SKd; Mon,  6 Nov 2023 01:57:44 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 058F21B8250F;
        Mon,  6 Nov 2023 01:57:44 +0700 (+07)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.hcrc.vn 058F21B8250F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hcrc.vn;
        s=64D43D38-C7D6-11ED-8EFE-0027945F1BFA; t=1699210664;
        bh=WOZURJ77pkiMUL2pPLC14ifVPRvyTQIBEQmxuN1ezAA=;
        h=MIME-Version:To:From:Date:Message-Id;
        b=m8lNUwUhQs9nMVsnx4DfgXYLkjA0kTappNqBfSAiJKU9wQlW30nQRKE0bj8M5e/F3
         0tp7K8Z59Yg+1MpXoLWRiGio6RtCnN1OIP0r3Pk30Iwa/St3BmW4eKWjW8GeHOe5jI
         prBub5vo9A9clwezXatMqyRj69ukzgbaHyWCPRCHXJEqnG9S9NX8r8AVe5KnWd7i9Q
         zyAjYDEGmaZphqq8UCUC4LxUuj1HB3phPlLXsz0pzMDyEEd7FXV/wkkWYSH3POhgk+
         PoFKfLLtVViuggk2CzFFyUBOXHYtWk+rZyAO2mEBCm1luOn4brzKtXpb6Guyrs4Rjx
         XMxr+AjuwvQbQ==
X-Virus-Scanned: amavisd-new at hcrc.vn
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 6gf0J9r2ROCE; Mon,  6 Nov 2023 01:57:43 +0700 (+07)
Received: from [192.168.1.152] (unknown [51.179.100.52])
        by zimbra.hcrc.vn (Postfix) with ESMTPSA id AA8A71B82534;
        Mon,  6 Nov 2023 01:57:37 +0700 (+07)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?b?4oKsIDEwMC4wMDAuMDAwPw==?=
To:     Recipients <ch.31hamnghi@hcrc.vn>
From:   ch.31hamnghi@hcrc.vn
Date:   Sun, 05 Nov 2023 19:57:27 +0100
Reply-To: joliushk@gmail.com
Message-Id: <20231105185737.AA8A71B82534@zimbra.hcrc.vn>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Goededag,
Ik ben mevrouw Joanna Liu en een medewerker van Citi Bank Hong Kong.
Kan ik =E2=82=AC 100.000.000 aan u overmaken? Kan ik je vertrouwen


Ik wacht op jullie reacties
Met vriendelijke groeten
mevrouw Joanna Liu

