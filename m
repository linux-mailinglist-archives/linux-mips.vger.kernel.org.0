Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D455108A0A
	for <lists+linux-mips@lfdr.de>; Mon, 25 Nov 2019 09:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfKYIaA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Nov 2019 03:30:00 -0500
Received: from sonic308-56.consmr.mail.ne1.yahoo.com ([66.163.187.31]:40042
        "EHLO sonic308-56.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725763AbfKYIaA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 Nov 2019 03:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1574670599; bh=F+7QXJPRuyxKv+5YqLXXhHJC5uuItS/uRvnxFMJ0nnQ=; h=Date:From:Reply-To:Subject:From:Subject; b=nM+uhpv0dUX8vW6slrLFWB1du7JeZIw1b2uZM1GTo80ZAXytVEbxg3CdRmJpcoei2aGtIfAZOvax7p8B3FIsJpQscrazIrkApClL6+FQfLaW0s+K3h/esb693Gv1vnUyBe9Stc8OaDR1Lf8Y1mPFyROhws9JDFcIaiLYmOFVWDVV/9H1tO+y9EqXUEqTbiZkpsQeaID4xTqIPK8L9hj6Kigv2LZuFu2YE5b3RGeCnWgB+tMzDM4+ZEzeuO/p2+mxCXme0u7SdhDtZS4GmIcS7tAZg9vChaZRpMdAFivfyzN0GsUh3RZXdJXm4azKhcQHdzxPc+djTJW0OrCGMK6QiA==
X-YMail-OSG: Xg6VgA8VM1kX_gSoNjvdKz.SQ0x2oRjY1G016mZf5c8K5wT5R5DYtdpIaVIOL6H
 8QKgvwvSDEQ5RlnGuRRc2DOnlHZd7eEyBCoyl3BCTOg.FIFbEypEf1TXHDA.N33ZPMC6iCgMLZIz
 eXi9tNGJcZn2wMQwm_emq6EXKvS.IRK.wg2DUUi4L6bAi8UMwUVLn7_36bJqVp6dYIVLTT4D4Pjr
 Zz6rDKJJYKp3YEkBQqYCG8aVNQj_Ln24BedCiKCRCjoDtQPYOlym.9OgWOyNVkNnbeW7xk8MsBAw
 TUqVEyLvXiBG713dspZy_SmbP2Rp32UxubUgnXwksRYvgsa7aqTEIrD5dPpEvnxbXJocep4T1ju8
 X4bOcunI1j_olhvmqx8iahZGo0hHicKHUJndqvSuuwu1BPZzWLsE0fckBAAbcra1f3DDIFZ.a_Bi
 6pZQXfx3HLZPb2MkwA1FQ.WjzENAFlCalrlzoYG2q5gPfJcDtuUNOBXUloKwnu0f9cqTMmvYadpy
 KORA9qQJgOFU8mDfuScRG4oFuUvPUR7xmw.ldi4eqOCzgMLz1uyUkgYI5vAkR2W.ql3ymE_UZP5s
 0pU5VD791DSk9KXKTJ5m1q7aAqWxeuf7CtdUo4Vd8owSbIbPWXS30t.V.ew1ZoOC4gKsM_E7fSm8
 GEY52Mt.NhIIufV8TKYzaEBV8ibL_wFA_gtSAGNNt9nGjjX0tiSIueg8vlQT_4VEyyeqoQ5GIam1
 OyAjqIOp89wKblC1FFe2KjdGheoG9Dfta3DoPF0.ebI7gv4DgU6J0C5RhPn1RIRqaO.3xGTRlqkw
 RHjo46YaDLPWtIaf.e2HJ2hfh6SBlXvgSU1zb3sGF7ajIyPeGmFJa8quOLxQAKm2H6TIO3wMYwC.
 C.eeD0RZMccJWfo4NbfsHTpp.ycxYTNuhxdngP9JYbsbWh3AFFD0uc3eA8brNkEhLQTLs7Q9WYoO
 lktYjjSyeH7zANqEZk2prANYkJ2nfwyT1Id.wNNL.TkavM.yE29yNQA1.ATKsDylm1Hef5XVYf8P
 gkhn2WLQ24Hyozbsmz1U9xBm_dqaVNDKUBL3EFP_1Gc7sZzlhKDcOAWu1XLCU_76SJmsMcYUYXgy
 lq9R.zZt9yg4cDg98NdjZxRo0.qDjn1cHdFzBzomVVtBltmBGGIVIsGFM3YIFbYSzSE.IG6O6P_3
 LHltPJH9DTLjvROYThShCAE2LF7C.TVtZYTcuyxddujpsveSe2fnAfZln2nhJgbmhd.w5hafXrZM
 bm8ukqZlOXDoBjCoE0wrd1BA6rWyMio9y5wvedPvcG8_ZRAOZY0mewGoxSeBwQsSa4fb_3pRvVkh
 AzvQFCiA-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ne1.yahoo.com with HTTP; Mon, 25 Nov 2019 08:29:59 +0000
Date:   Mon, 25 Nov 2019 08:29:57 +0000 (UTC)
From:   MR DAN KOURE <dankoure2@gmail.com>
Reply-To: dkoure73@gmail.com
Message-ID: <1998420282.4920840.1574670597198@mail.yahoo.com>
Subject: I NEED YOUR HELP FOR THIS BUSINESS.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Dear Friend,

I am Mr Dan Koure work with the department of Audit and accounting manager here in the Bank,

Please i need your assistance for the transferring of this abandon (US$4.5M DOLLARS) to your bank account for both of us benefit.

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me after success.

Below information that is needed from you.

1)Private telephone number...
2)Age...
3)Nationality...
4)Occupation ...
5)Full Name....
Thanks.

Mr Dan Koure
