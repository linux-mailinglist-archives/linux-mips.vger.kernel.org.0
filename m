Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D96445AFCC
	for <lists+linux-mips@lfdr.de>; Wed, 24 Nov 2021 00:10:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbhKWXNm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Nov 2021 18:13:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233494AbhKWXNl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Nov 2021 18:13:41 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 335C7C061714
        for <linux-mips@vger.kernel.org>; Tue, 23 Nov 2021 15:10:33 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id x32so1681143ybi.12
        for <linux-mips@vger.kernel.org>; Tue, 23 Nov 2021 15:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=8YefciyY8ODsLHs6dnysg1GoDMAPCTtNvXqSnG3+7jU=;
        b=HPzeF5d9IsAW8NNs70u7O5h3NSzTe/2fs+AxzOStQVNCPzecWmYFem527N6R/YoiTa
         2vdVVUtgeFEoUbkOHqRzMdSjdxM8xIjPNujv6iXvA4CMggP3tpMnKAjRpX5ZH+/82z4a
         ce1ssNfOjcX7vfsZKKHsXdO/DrXEFfyK7GdcgWxRqlhA7/lwOo+HCx72Tjt3L++APqnt
         qfjdJie/k80hXoGG08FiThGFf1AJHgQ6qt5qmiBzPFJ574NCRtL+51qFEY/AMuWRRuIY
         uhSnaIv6Wdc0605By9dpx48esK0XHRHefqMVGaYJNIR6gPb4mtOtvgR6dmrePXfOLlkY
         +NOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=8YefciyY8ODsLHs6dnysg1GoDMAPCTtNvXqSnG3+7jU=;
        b=xBQXkua9JdHpzwdODoebkZ6oGN5JVb5MV6SVetB//Z+DBzyB8d2dcV4DSwBdynw71I
         2p8FBl++SdKI+w8etFUK70PVUzL5BKzZHgV0HZwSbPdXj64njNcW5Crw1CBBXh2jL3cm
         APjJnJ2RnoLtU0IjK8Bdj4nuCYlrb0OyzZxvRN6TeyBb6dBjwziRAUfRlYhkuMOtyc7L
         oIm/exaHpU0LkEKZGQknVjbiYL/1dSHDV+4/5QMjpp5ThzwXkZD58gLfHIXXDbdWOj6L
         rG7/fGPG+vf+/zJR0o0x5I2/MXu8KXw4Y31v74jgwXO4CY2HsoZyd+bH/sNfrxF9echN
         oQnA==
X-Gm-Message-State: AOAM530wIL1qzxZvEk4iEa+ICtWNnGw49gUJdmCIyPmEV8zDtWjt7Xxq
        G5zLXITsibZif3fDsY+6fZi7ZanGkNclmR7yKhs=
X-Google-Smtp-Source: ABdhPJxcDzh4pVSSW+jClQ1hMPu0DSz9Izwub/62vuLzS9H1trPUkGOG7p+K3Mf1qnlb2zFXLxLnlDPTx3KceIExlCw=
X-Received: by 2002:a25:cec1:: with SMTP id x184mr10785214ybe.455.1637709032432;
 Tue, 23 Nov 2021 15:10:32 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:35a8:b0:102:6d2:8e94 with HTTP; Tue, 23 Nov 2021
 15:10:32 -0800 (PST)
Reply-To: frankiebilla@gmail.com
In-Reply-To: <CA+fkpfesaKt0LrKTN2mBoBukTjXHmLMo5ptm-LwNqGxMTjBoLA@mail.gmail.com>
References: <CA+fkpffFzBhuxRhOMM5X_Jte8b0FK2WMyQ5o=TpAN32P1GSFmg@mail.gmail.com>
 <CA+fkpff7Hw9RjJf7zwmFhhU5_KySmJa76VMOtjYUgBN_Q=2yXA@mail.gmail.com> <CA+fkpfesaKt0LrKTN2mBoBukTjXHmLMo5ptm-LwNqGxMTjBoLA@mail.gmail.com>
From:   robertskevin <kindnesschibuenyim@gmail.com>
Date:   Tue, 23 Nov 2021 15:10:32 -0800
Message-ID: <CA+fkpfe4hOD_dq8erGruJ5-NcpBKq1tgyv+SCXY=RsZ_7EkubA@mail.gmail.com>
Subject: Very confidential
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello dear, I wish to discuss about Late pilot Lewis Tonkinson
investment  project. Reply for more details, Regards.
