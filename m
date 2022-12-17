Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B81764F915
	for <lists+linux-mips@lfdr.de>; Sat, 17 Dec 2022 14:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbiLQN1j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Dec 2022 08:27:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiLQN1i (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 17 Dec 2022 08:27:38 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A897FCE27
        for <linux-mips@vger.kernel.org>; Sat, 17 Dec 2022 05:27:37 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id bj12so12013021ejb.13
        for <linux-mips@vger.kernel.org>; Sat, 17 Dec 2022 05:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UleXfybfkB/Pp7XCNYIxvDWfUpO/oLpvjkUbrsMk7bk=;
        b=KNAnMeLTG1p+t9Jz5x0NNbjhRNOBs19LfoDcAt8bqOm7CC3pUikmJTPvHDshXdE8Xz
         N5dr/CQoopg5Sc6R+lCM/RKsYujUwwsJWTuIMg2ltISDrFelWb3WwITMUES55sumEoQu
         NJjuMH4qZdsz8y4KCpPDe1P9lIKHv2+8mW5qK2eQcdhzJ9cTL0n8suen+NC70hJJ1mEF
         CfOLG8XH2vQDU/XnHKbiv8gWviSBeMLauDKhA6Ue79OATaQkDiR7U2CiXOvPVBXelcQc
         v+y1Gzoop6Z8M3Sy12wFM/PeyyZ+PnOdhH2gf1u81OsPjMnJ0qwumuixuuxpVu0KtG89
         dUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UleXfybfkB/Pp7XCNYIxvDWfUpO/oLpvjkUbrsMk7bk=;
        b=j7yMIYwtOWjLJicp7rR/0PfYW5fyzzA5G+13WOrW0eXy+/BeiQFVARlI0jA10AgPUX
         kzjK9LkZuaKNHteO3Ke6KINNH3M0YxEYx3jPA4GeUGWbmyILXF+I9x1TajC6ZD/l3apP
         2I58Oksgh67TrTHXEgwepw2wlze4Yum9uPtSIhem4uUcL3drH7ETlxcAIWXao28SSvXs
         ZvGL5F4BlY4S+EyWXmCnxF1wp5TFxc/ZtQLatmJvXxn1+4ZfIMsIefJ0eY74tc1LJXLS
         9it6/3Xtwz2vJylZb9KahLadE9OB+5iosfvs2vlgDoxuwVr40JJ1l2RgLXmgvlRJaCb+
         IJIg==
X-Gm-Message-State: ANoB5pmYiMvCtLxkfkHY0l3QuvNXlj+sfmAg25oTmmXaDvE65Kr8I0qg
        S7wsOkwCUfZ2yCj77sspHRYWKnn6ijChmf/oMf8NH77uen8=
X-Google-Smtp-Source: AA0mqf54Z+LKBt/MQ4D4E2vVSgrblJf0HFqi540oXZ4JqnKS+yXW6654wQQP2r9Hq+ZGjRJvoxWtpI87MpWkWkgPfFQ=
X-Received: by 2002:a17:906:2a9a:b0:7bb:e82a:83d with SMTP id
 l26-20020a1709062a9a00b007bbe82a083dmr54856887eje.612.1671283656218; Sat, 17
 Dec 2022 05:27:36 -0800 (PST)
MIME-Version: 1.0
Sender: noureniouroifa@gmail.com
Received: by 2002:a05:7412:8412:b0:8f:5ea9:b82c with HTTP; Sat, 17 Dec 2022
 05:27:35 -0800 (PST)
From:   John Kumor <mrwuso3@gmail.com>
Date:   Sat, 17 Dec 2022 13:27:35 +0000
X-Google-Sender-Auth: bYtkbUrG2j-T8uJEzt7KoNNw_KY
Message-ID: <CAGUuoFDEHBPDV563AtGbNtdXPj2n3Jfh6-92kTn2p6Gnzj=JiA@mail.gmail.com>
Subject: Kindly reply back.
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

Greetings!!
Did you receive my previous email?
Regards,
John Kumor,
